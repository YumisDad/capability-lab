$ErrorActionPreference = 'Stop'
$repoPath = [IO.Path]::GetFullPath((Join-Path $PSScriptRoot 'capability-lab'))
$linkPath = [IO.Path]::GetFullPath((Join-Path $repoPath '.agents/skills/evidence-based-change-review'))
$parkingPath = [IO.Path]::GetFullPath((Join-Path $PSScriptRoot 'baseline-skill-junction'))
if (-not $linkPath.StartsWith($repoPath + [IO.Path]::DirectorySeparatorChar)) { throw 'Exposure outside repository' }
if (-not $parkingPath.StartsWith($PSScriptRoot + [IO.Path]::DirectorySeparatorChar)) { throw 'Parking path outside workspace' }
if ((Get-Item -LiteralPath $linkPath).LinkType -ne 'Junction') { throw 'Expected junction; refusing to move a normal directory' }
if (Test-Path -LiteralPath $parkingPath) { throw 'Parking path already exists' }
$originalHash = (Get-FileHash -LiteralPath (Join-Path $linkPath 'SKILL.md')).Hash
$moved = $false
try {
    Move-Item -LiteralPath $linkPath -Destination $parkingPath
    $moved = $true
    $diagnosticLines = & codex -C $repoPath -s read-only debug prompt-input 'Reply with READY.'
    if ($LASTEXITCODE -ne 0) { throw 'Baseline discovery diagnostic failed' }
    $diagnosticItems = ($diagnosticLines -join "`n") | ConvertFrom-Json
    $skillText = @($diagnosticItems | ForEach-Object { $_.content } | Where-Object { $_.text -like '<skills_instructions>*' } | ForEach-Object { $_.text })
    $targetEntries = @($skillText -split "`n" | Where-Object { $_ -like '*evidence-based-change-review*' })
    [pscustomobject]@{ probe='baseline-discovery'; targetSkillInModelVisibleCatalog=($targetEntries.Count -gt 0); entries=$targetEntries; canonicalSourceRetained=(Test-Path -LiteralPath (Join-Path $repoPath 'skills/evidence-based-change-review/SKILL.md')) } | ConvertTo-Json -Depth 4 | Set-Content -LiteralPath (Join-Path $PSScriptRoot 'baseline-discovery.json') -Encoding UTF8
    if ($targetEntries.Count -gt 0) { throw 'Target skill still discovered; baseline invalid' }
    & node (Join-Path $PSScriptRoot 'run-batch.cjs') baseline A1 A3 B2 B6
    if ($LASTEXITCODE -ne 0) { throw 'Baseline runner failed' }
} finally {
    if ($moved) {
        if (Test-Path -LiteralPath $linkPath) { throw 'Unexpected exposure replacement; preserve parked junction' }
        Move-Item -LiteralPath $parkingPath -Destination $linkPath
        $restoredHash = (Get-FileHash -LiteralPath (Join-Path $linkPath 'SKILL.md')).Hash
        if ($restoredHash -ne $originalHash) { throw 'Exposure restoration hash mismatch' }
        [pscustomobject]@{ restored=$true; originalHash=$originalHash; restoredHash=$restoredHash; linkType=(Get-Item -LiteralPath $linkPath).LinkType } | ConvertTo-Json | Set-Content -LiteralPath (Join-Path $PSScriptRoot 'baseline-restoration.json') -Encoding UTF8
        Write-Output 'Baseline complete; original junction restored.'
    }
}
