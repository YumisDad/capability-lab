const cp = require('node:child_process');
const path = require('node:path');
const phase = process.argv[2];
const ids = process.argv.slice(3);
for (const id of ids) {
  const child = cp.spawnSync(process.execPath,[path.join(__dirname,'run-case.cjs'),id,phase],{stdio:'inherit',windowsHide:true});
  if (child.status !== 0) process.exit(child.status || 1);
}
