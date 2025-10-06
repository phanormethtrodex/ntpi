# ntpi
ntp raspi daemon

the ntp daemonizer script (ntpz.sh) shall perform the following:
1) update ntp.conf to disable local-sync (127.127.1.1)
2) add/enable remote NIST source server
3) restart ntp service to apply the recon
4) wait for time to remote-sync
5) revert ntp.conf for local/self-sync now we know the time
6) re-restart ntpd and monitor/poll ntp until .LOCL. src is trusted (*):
```
[ntpi@raspi:~$> ntpq -np
remote           refid      st t when poll reach   delay   offset  jitter
==============================================================================
*129.6.15.29     .NIST.           1 u    1   64    1   42.002  -57.035   4.720 
*127.127.1.1     .LOCL.           5 l    6   64  377    0.000    0.000   0.001
```

7) upon resync success, say/display current time and return 0

included files:
ntpi daemon: 
script to monitor ntp sources until trusted: ntpz.sh
loc-rem-loc ntp.conf auto-reconfig script: rentp.sh
example ntp config file with the loc/rem sources to swap/toggle: ntp.conf
example synch script usage: 1200 (re: flashing 12:00 on clocks on power loss)





