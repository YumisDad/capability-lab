const cp = require('node:child_process');
const fs = require('node:fs');
const path = require('node:path');
const crypto = require('node:crypto');
const repo = path.join(__dirname,'capability-lab');
const out = path.join(__dirname,'focused-eval-runs');
fs.mkdirSync(out,{recursive:true});
const environmentPath = path.join(out,'environment.json');
if(fs.existsSync(environmentPath)) throw new Error('Focused experiment already started; do not overwrite or rerun');
const git = (...args) => cp.execFileSync('git',args,{cwd:repo,encoding:'utf8'}).trim();
const hashes = Object.fromEntries(['skills/evidence-based-change-review/SKILL.md','.agents/skills/evidence-based-change-review/SKILL.md','skills/evidence-based-change-review/references/review-criteria.md','evals/evidence-based-change-review/activation-cases.md','evals/evidence-based-change-review/behavior-cases.md','evals/evidence-based-change-review/expected-properties.md'].map(file=>[file,crypto.createHash('sha256').update(fs.readFileSync(path.join(repo,file))).digest('hex')]));
fs.writeFileSync(environmentPath,JSON.stringify({runtime:cp.execFileSync('codex',['--version'],{encoding:'utf8'}).trim(),configuredModel:'gpt-6-astra',configuredReasoningEffort:'xhigh',modelQualification:'Read from CLI configuration; served model not independently reported in execution events. No model override.',branch:git('branch','--show-current'),commit:git('rev-parse','HEAD'),tree:git('rev-parse','HEAD^{tree}'),cleanBeforeTesting:git('status','--porcelain=v1')==='',mechanism:'Existing Windows junction at .agents/skills/evidence-based-change-review to canonical skills/evidence-based-change-review',exposureResolvesToCanonical:fs.realpathSync(path.join(repo,'.agents/skills/evidence-based-change-review'))===fs.realpathSync(path.join(repo,'skills/evidence-based-change-review')),hashes,setupAttempt:'Initial fetch stalled and was canceled before testing. A timeout-bounded fetch succeeded. No runtime case was retried.'},null,2));
const cases = [['A1',1],['A3',1],['N1',1],['N5',1],['M1',1],['M1',2],['M1',3],['M2',1],['M2',2],['M2',3],['B10',1],['B10',2]];
for (const [id,run] of cases) {
  const child = cp.spawnSync(process.execPath,[path.join(__dirname,'run-focused-case.cjs'),id,String(run)],{stdio:'inherit',windowsHide:true});
  if (child.status !== 0) process.exit(child.status || 1);
  const meta = JSON.parse(fs.readFileSync(path.join(__dirname,'focused-eval-runs',id+'-'+run+'.meta.json'),'utf8'));
  if (meta.exitCode !== 0 || meta.signal !== null) throw new Error('Runtime did not finish; retain evidence and stop for inspection');
}
