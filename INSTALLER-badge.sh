#!/bin/bash

echo; echo
echo "This installer will change your Plymouth theme,"
echo "giving a new look to your boot screen."
echo "Please enter your password for this."
sudo mkdir -p /usr/share/plymouth/themes && sudo cp -rf mint-logo-badge /usr/share/plymouth/themes
echo
echo "This will take a few seconds."
echo "DO NOT QUIT until you are invited to do so..."
echo
sudo update-alternatives --install /usr/share/plymouth/themes/default.plymouth default.plymouth /usr/share/plymouth/themes/mint-logo-badge/mint-logo-badge.plymouth 200 &&
sudo update-alternatives --set default.plymouth /usr/share/plymouth/themes/mint-logo-badge/mint-logo-badge.plymouth &&
sudo update-initramfs -u
# Extras
sudo mkdir -p /usr/share/icons/SebastJava-logo &&
sudo cp -f extras/badge-symbolic.svg extras/trident-symbolic.svg extras/Y-negative-symbolic.svg /usr/share/icons/SebastJava-logo
sudo mkdir -p /usr/share/backgrounds &&
sudo cp -f extras/login-WP-badge-v2.svg extras/login-WP-trident-v2.svg extras/login-WP-Y-neg-v2.svg /usr/share/backgrounds
# Preview
echo
echo "INSTALLATION COMPLETED !"
echo
echo "Do you wish to see a 10 seconds preview?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) sudo plymouthd; sudo plymouth --show-splash; sleep 10; sudo plymouth quit; exit;;
        No ) exit;;
    esac
done
