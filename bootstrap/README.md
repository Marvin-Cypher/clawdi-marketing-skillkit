# Bootstrap

Run this on each teammate machine to install required repos and skills:

```bash
bash bootstrap/install-resources.sh
```

Optional custom paths:

```bash
bash bootstrap/install-resources.sh /custom/repos/path /custom/skills/path
```

After install, restart OpenClaw or refresh skill discovery.


## Clawdi main repo access
By default the bootstrap **does not** clone `Clawdi-AI/clawdi` (team members may not have access).

If someone has access and wants a local read-only reference clone:

```bash
INSTALL_CLAWDI_REF=1 bash bootstrap/install-resources.sh
```
