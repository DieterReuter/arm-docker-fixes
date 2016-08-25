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

*for HypriotOS use:*
```
ssh pirate@192.168.2.104 "curl -sSL https://github.com/DieterReuter/arm-docker-fixes/raw/master/001-fix-docker-machine-1.8.0-create-for-arm/apply-fix-001.sh | bash"
```
*for Raspbian use:*
```
ssh pi@192.168.2.104 "curl -sSL https://github.com/DieterReuter/arm-docker-fixes/raw/master/001-fix-docker-machine-1.8.0-create-for-arm/apply-fix-001.sh | bash"
```

## Use Docker Machine with your remote Raspberry Pi
With this command you can now easily create and attach a new Docker Engine on your Raspberry Pi, then you can control it via the Docker Machine CLI from your Mac or Linux machine.

*for HypriotOS use:*
```
#!/bin/sh
set -e

# access the Raspberry Pi running HypriotOS
IPADDRESS=192.168.2.104
PI_USERNAME=pirate
PI_PASSWORD=hypriot

# deploy a Docker 1.12.1
docker-machine create \
  --driver=generic \
  --engine-storage-driver=overlay \
  --generic-ip-address=$IPADDRESS \
  --generic-ssh-user=$PI_USERNAME \
  --engine-install-url=https://get.docker.com/ \
  pi
```
*for Raspbian use:*
```
#!/bin/sh
set -e

# access the Raspberry Pi running Raspbian/Jessie
IPADDRESS=192.168.2.104
PI_USERNAME=pi
PI_PASSWORD=raspberry

# deploy a Docker 1.12.1
docker-machine create \
  --driver=generic \
  --engine-storage-driver=overlay \
  --generic-ip-address=$IPADDRESS \
  --generic-ssh-user=$PI_USERNAME \
  --engine-install-url=https://get.docker.com/ \
  pi
```


## Acknowledgements

If the fix works for you, please tweet me a success message on Twitter, if it doesn't please feel free to open an issue here - or better try to resolve the issue and file a PR. ;-)

Cheers, <br>
Dieter [@Quintus23M](https://twitter.com/Quintus23M)
