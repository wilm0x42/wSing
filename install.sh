#!/bin/bash

cd /opt/wSing/

rm -rf __pycache__/

cp wsing.service /lib/systemd/system/wsing.service

date >> upgrade-log.txt
git rev-parse HEAD >> upgrade-log.txt

systemctl daemon-reload
systemctl start wsing.service
systemctl enable wsing.service
