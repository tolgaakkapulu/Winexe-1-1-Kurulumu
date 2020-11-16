#!/bin/bash

echo -e "\e[31m+-+-+ WINEXE 1.1 Installation +-+-+\e[0m\n"
sleep 1

echo -e "\e[1;34msudo apt-get -y install gcc-mingw-w64 comerr-dev libpopt-dev libbsd-dev zlib1g-dev libc6-dev python-dev libacl1-dev libldap2-dev git\e[0m"
sleep 1
sudo apt-get -y install gcc-mingw-w64 comerr-dev libpopt-dev libbsd-dev zlib1g-dev libc6-dev python-dev libacl1-dev libldap2-dev git

echo -e "\e[1;34mgit clone "https://github.com/tolgaakkapulu/Winexe-1.1-Installation"\e[0m"
sleep 1
git clone "https://github.com/tolgaakkapulu/Winexe-1.1-Installation"

echo -e "\e[1;34mcd Winexe-1.1-Installation\e[0m"
sleep 1
cd Winexe-1.1-Installation

echo -e "\e[1;34mtar xzf samba-4.1.23.tar.gz\e[0m"
sleep 1
tar xzf samba-4.1.23.tar.gz

echo -e "\e[1;34mtar xzf winexe-winexe-waf.tar.gz\e[0m"
sleep 1
tar xzf winexe-winexe-waf.tar.gz

echo -e "\e[1;34mcd winexe-winexe-waf/source/\e[0m"
sleep 1
cd winexe-winexe-waf/source/

echo -e "\e[1;34msed -i "s/stlib='smb_static bsd z resolv rt'/stlib='smb_static z rt'/g" wscript_build\e[0m"
sleep 1
sed -i "s/stlib='smb_static bsd z resolv rt'/stlib='smb_static z rt'/g" wscript_build

echo -e "\e[1;34msed -i "s/lib='dl'/lib='dl resolv bsd'/g" wscript_build\e[0m"
sleep 1
sed -i "s/lib='dl'/lib='dl resolv bsd'/g" wscript_build

echo -e "\e[1;34mchmod +x waf\e[0m"
sleep 1
chmod +x waf

echo -e "\e[1;34m./waf --samba-dir=../../samba-4.1.23 configure build\e[0m"
sleep 1
./waf --samba-dir=../../samba-4.1.23 configure build

echo -e "\e[1;34mcp build/winexe-static /usr/local/bin/winexe\e[0m"
sleep 1
cp build/winexe-static /usr/local/bin/winexe

echo -e "\n\e[31mUsage : \e[0m\e[1;34mwinexe -U domain/username%password //ip_address 'command'\e[0m"
echo -e "\n\e[31m+-+-+ WINEXE 1.1 Installation Complete +-+-+\e[0m"
