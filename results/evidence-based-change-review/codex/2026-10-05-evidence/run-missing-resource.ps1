param([string]$CaseId = 'B7', [string]$Phase = 'missing-resource')
$ErrorActionPreference = 'Stop'
$repoPath = [IO.Path]::GetFullPath((Join-Path $PSScriptRoot 'capability-lab'))
$refPath = [IO.Path]::GetFullPath((Join-Path $repoPath 'skills/evidence-based-change-review/references/review-criteria.md'))
$backupPath = [IO.Path]::GetFullPath((Join-Path $PSScriptRoot 'b7-reference-backup.md'))
if (-not $refPath.StartsWith($repoPath + [IO.Path]::DirectorySeparatorChar)) { throw 'Reference path outside repository' }
if (-not $backupPath.StartsWith($PSScriptRoot + [IO.Path]::DirectorySeparatorChar)) { throw 'Backup path outside experiment workspace' }
if (Test-Path -LiteralPath $backupPath) { throw 'Existing backup; refusing to overwrite' }
$originalHash = (Get-FileHash -LiteralPath $refPath -Algorithm SHA256).Hash
$moved = $false
try {
    Move-Item -LiteralPath $refPath -Destination $backupPath
    $moved = $true
    if (Test-Path -LiteralPath (Join-Path $repoPath '.agents/skills/evidence-based-change-review/references/review-criteria.md')) { throw 'Reference still exposed' }
    if (-not (Test-Path -LiteralPath (Join-Path $repoPath '.agents/skills/evidence-based-change-review/SKILL.md'))) { throw 'Core skill not exposed' }
    & node (Join-Path $PSScriptRoot 'run-case.cjs') $CaseId $Phase
    if ($LASTEXITCODE -ne 0) { throw 'B7 runner failed' }
} finally {
    if ($moved) {
        if (Test-Path -LiteralPath $refPath) { throw 'Unexpected replacement reference; preserve backup for safe recovery' }
        Move-Item -LiteralPath $backupPath -Destination $refPath
        $restoredHash = (Get-FileHash -LiteralPath $refPath -Algorithm SHA256).Hash
        if ($restoredHash -ne $originalHash) { throw 'Reference restoration hash mismatch' }
        [pscustomobject]@{ test=$CaseId; phase=$Phase; originalHash=$originalHash; restoredHash=$restoredHash; restored=$true; coreRemainedAccessible=$true } | ConvertTo-Json | Set-Content -LiteralPath (Join-Path $PSScriptRoot ($Phase + '-restoration.json')) -Encoding UTF8
        Write-Output 'Reference restored with matching SHA-256.'
    }
}
