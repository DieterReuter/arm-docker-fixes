# `002-fix` for Installing Docker on C.H.I.P. computer


## Affected OSes

* C.H.I.P. Debian 4.4.1


## Purpose

This script installs the latest Docker Engine from the official Docker APT repo on a C.H.I.P. computer running Debian 4.4.1 (tested with image `Headless 4.4`).


## Run the installer script

You can run the installer script directly on the C.H.I.P., so you have to login as user `root` and run the script:
```
curl -sSL https://github.com/DieterReuter/arm-docker-fixes/raw/master/002-fix-install-docker-on-chip-computer/apply-fix-002.sh | bash
```


## Acknowledgements

If the install script works for you, please tweet me a success message on Twitter, if it doesn't please feel free to open an issue here - or better try to resolve the issue and file a PR. ;-)

Cheers, <br>
Dieter [@Quintus23M](https://twitter.com/Quintus23M)
