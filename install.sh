#!/bin/sh

echo
echo
echo "Welcome to amtwifi installer :)"
echo
echo

#copy the script to $PATH
cp amtwifi /usr/bin/amtwifi
chmod +x /usr/bin/amtwifi

#setup profile
mkdir -p /etc/wlan/

echo "!!ALL THESE DATA ARE CASE-SENSITIVE!!"

echo -n "WiFi SSID name: "
read ssid

echo -n "Username: "
read username

echo -n "Password: "
read password

config="network={
    ssid=\"$ssid\"
    scan_ssid=1
    key_mgmt=WPA-EAP
    eap=PEAP
    identity=\"$username\"
    password=\"$password\"
    phase1=\"peaplabel=0\"
    phase2=\"auth=MSCHAPV2\"
}"

echo $config > /etc/wlan/$ssid.conf
