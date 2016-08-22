# `001-fix` for Docker Machine 1.8.0


## Affected OSes

* HypriotOS 1.0.0
* Raspbian Jessie & Raspbian Jessie LITE 2016-05-10
* Raspbian Jessie & Raspbian Jessie LITE 2016-05-27


## Issue

When using Docker Machine 1.8.0 to create a Docker Engine on the affected target OSes you run into errors which cannot be resolved easily.


## Applying the hotfix

Apply the fix script on the affected OSes before running a `docker-machine create ...` command.

You can either run the fix script directly on the OS, so you have to login and run the script:
```
curl -sSL https://github.com/DieterReuter/arm-docker-fixes/raw/master/001-fix-docker-machine-1.8.0-create-for-arm/apply-fix-001.sh | bash
```

Or you can just use `ssh` from a Mac or a Linux machine:
```

```


## Background Informations



## Acknowledgements

If the fix works for you, please tweet me a success message on Twitter, if it doesn't please feel free to open an issue here - or better try to resolve the issue and file a PR. ;-)

Cheers, <br>
Dieter [@Quintus23M](https://twitter.com/Quintus23M)
