#!/bin/bash

echo "This is a 10 seconds boot sequence preview..."
echo "Please enter your user password for this..."
sudo plymouthd; sudo plymouth --show-splash; sleep 10; sudo plymouth quit
exit
