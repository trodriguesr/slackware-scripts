#!/bin/bash

VERSION_SLACKWARE=14.2

mkdir multilib && cd multilib

lftp -c "open http://bear.alienbase.nl/mirrors/people/alien/multilib/ ; mirror -c -e ${VERSION_SLACKWARE}"

cd ${VERSION_SLACKWARE}

upgradepkg --reinstall --install-new *.t?z && \

upgradepkg --install-new slackware64-compat32/*-compat32/*.t?z

cat >> /etc/slackpkg/blacklist <<EOF
[0-9]+alien
[0-9]+compat32
EOF
