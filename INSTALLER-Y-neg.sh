#!/bin/bash

echo; echo
echo "This installer will change your Plymouth theme,"
echo "giving a new look to your boot screen."
echo "Please enter your password for this."
sudo mkdir -p /usr/share/plymouth/themes && sudo cp -rf mint-logo-Y-neg /usr/share/plymouth/themes
echo
echo "This will take a few seconds."
echo "DO NOT QUIT until you are invited to do so..."
echo
sudo update-alternatives --install /usr/share/plymouth/themes/default.plymouth default.plymouth /usr/share/plymouth/themes/mint-logo-Y-neg/mint-logo-Y-neg.plymouth 200 &&
sudo update-alternatives --set default.plymouth /usr/share/plymouth/themes/mint-logo-Y-neg/mint-logo-Y-neg.plymouth &&
sudo update-initramfs -u
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
