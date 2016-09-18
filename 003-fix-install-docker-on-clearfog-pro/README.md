# `003-fix` for Installing Docker on ClearFog Pro


## Affected OSes

* ClearFog Pro Armbian 5.20


## Purpose

This script installs the latest Docker Engine from the official Docker APT repo on a ClearFog Pro router board running Armbian 5.20 (tested with image `Armbian_5.20_Armada_Debian_jessie_4.7.3.img`).


## Run the installer script

You can run the installer script directly on the ClearFog Pro, so you have to login as user `root` and run the script:
```
curl -sSL https://github.com/DieterReuter/arm-docker-fixes/raw/master/003-fix-install-docker-on-clearfog-pro/apply-fix-003.sh | bash
```


## Acknowledgements

If the install script works for you, please tweet me a success message on Twitter, if it doesn't please feel free to open an issue here - or better try to resolve the issue and file a PR. ;-)

Cheers, <br>
Dieter [@Quintus23M](https://twitter.com/Quintus23M)
