#!/bin/bash
set -e

if [[ ! -f "/etc/os-release" ]]; then
	echo "ERROR: can't determine OS type"
	exit 1
fi

# read os-release infos
. /etc/os-release
if [[ "x$NAME" != "xRaspbian GNU/Linux" ]]; then
	echo "ERROR: wrong OS type '$NAME'"
	exit 1
fi

# check if the Docker Engine is installed
DOCKERVERSION=$(set +e; docker -v 2>/dev/null; set -e)
if [[ "x$DOCKERVERSION" == "x" ]] || [[ ! -e /var/run/docker.sock ]]; then
	echo "ERROR: Docker Engine is not installed, please install it before applying this fix"
	exit 1
fi


### part 1:

# apply fix part 1: change ID to 'debian'
if [[ "x$ID" == "xraspbian" ]]; then
	sudo sed -i 's|ID=raspbian|ID=debian|' /etc/os-release
	echo "SUCCESS: fix part 1 applied, changed 'ID=debian'!"
fi


### part 2:

if [[ -f "/etc/systemd/system/docker.service.d/overlay.conf" ]]; then
	sudo cp /lib/systemd/system/docker.service /etc/systemd/system/docker.service
	sudo sed -i 's|ExecStart=/usr/bin/dockerd -H|ExecStart=/usr/bin/dockerd --storage-driver overlay -H|' /etc/systemd/system/docker.service
	sudo rm -fr /etc/systemd/system/docker.service.d
	sudo systemctl daemon-reload
	echo "SUCCESS: fix part 2 applied, removed 'overlay.conf'!"
fi


### done - SUCCESS
echo "SUCCESS: Fix 001 successfully applied."
echo "  don't forget to send me a tweet to @Quintus23, thanks.  ;-)"
