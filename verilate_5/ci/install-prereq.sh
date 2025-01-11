#!/bin/bash

echo 'deb http://download.opensuse.org/repositories/home:/phiwag:/edatools/xUbuntu_20.04/ /' | tee /etc/apt/sources.list.d/home:phiwag:edatools.list
curl -fsSL https://download.opensuse.org/repositories/home:phiwag:edatools/Debian_Unstable/Release.key | gpg --dearmor | tee /etc/apt/trusted.gpg.d/home_phiwag_edatools.gpg > /dev/null

apt update
apt install device-tree-compiler libfl-dev help2man

