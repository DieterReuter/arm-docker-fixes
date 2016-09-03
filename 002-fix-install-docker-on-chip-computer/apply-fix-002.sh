#!/bin/bash
set -e

if [[ ! -f "/etc/os-release" ]]; then
	echo "ERROR: can't determine OS type"
	exit 1
fi

# read os-release infos
set +e; . /etc/os-release 2>/dev/null; set -e
if [[ "x$NAME" = "xDebian GNU/Linux" ]] && [[ -e "/etc/chip_build_info.txt" ]]; then
	echo "INFO: OS Debian on C.H.I.P. computer detected."
else
	echo "ERROR: wrong OS type '$NAME'"
	exit 1
fi


# part 1: 

# install Docker default settings for overlay fs
mkdir -p /etc/systemd/system
rm -fr /etc/systemd/system/docker.service*
curl -sSL https://raw.githubusercontent.com/docker/docker/master/contrib/init/systemd/docker.service > /etc/systemd/system/docker.service
sed -i 's|ExecStart=/usr/bin/dockerd -H|ExecStart=/usr/bin/dockerd --storage-driver overlay -H|' /etc/systemd/system/docker.service
rm -fr /etc/systemd/system/docker.service.d
systemctl daemon-reload
echo "SUCCESS: fix part 1 applied, created '/etc/systemd/system/docker.service'!"


# part 2: 

# ensure we have APT https support installed
if [[ ! -e /usr/lib/apt/methods/https ]]; then
	apt-get update
	apt-get install -y apt-transport-https ca-certificates
fi

# install APT keys for Docker APT repo
gpg_fingerprint="58118E89F3A912897C070ADBF76221572C52609D"
key_servers="
ha.pool.sks-keyservers.net
pgp.mit.edu
keyserver.ubuntu.com
"
for key_server in $key_servers ; do
	apt-key adv --keyserver "hkp://${key_server}:80" --recv-keys ${gpg_fingerprint} && break
done
apt-key adv -k ${gpg_fingerprint} >/dev/null

# create repo list for Docker APT repo
#TODO: change to 'debian-jessie' as soon as the .deb is available on Docker APT repo
echo "deb [arch=armhf] https://apt.dockerproject.org/repo raspbian-jessie main" > /etc/apt/sources.list.d/docker.list
echo "SUCCESS: fix part 2 applied, created '/etc/apt/sources.list.d/docker.list'!"


# part 3: 

# install Docker Engine
apt-get update
apt-get install -y docker-engine
echo "SUCCESS: fix part 3 applied, Docker Engine installed!"
docker -v
docker version


### done - SUCCESS
echo -e "\nSUCCESS: Fix 002 successfully applied."
echo "  don't forget to send me a tweet to @Quintus23M, thanks.  ;-)"
