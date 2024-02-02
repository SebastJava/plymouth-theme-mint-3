#!/bin/bash

echo; echo
echo "This installer will change your Plymouth theme,"
echo "reverting to your standard Mint logo."
echo "Please enter your password for this."
echo
sudo update-alternatives --install /usr/share/plymouth/themes/default.plymouth default.plymouth /usr/share/plymouth/themes/mint-logo/mint-logo.plymouth 200 &&
sudo update-alternatives --set default.plymouth /usr/share/plymouth/themes/mint-logo/mint-logo.plymouth &&
echo &&
echo "This will take a few seconds." &&
echo "DO NOT QUIT until you are invited to do so..." &&
echo &&
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
