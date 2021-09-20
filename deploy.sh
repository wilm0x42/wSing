#!/bin/sh

excludes="--exclude=botconf.json --exclude=__pycache__ --exclude=upgrade-log.txt"


if [ -z "$1" ]; then
	echo "Usage: deploy.sh user@remotehost"
	exit 0
fi

echo "Uploading files via rsync"
rsync $excludes --delete -a . $1:/opt/wSing/
echo "Done!"

echo "Running install.sh on remote host"
ssh -t $1 -C "cd /opt/wSing/; sudo ./install.sh"
echo "Done!"
