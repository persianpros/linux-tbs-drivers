#!/bin/bash

echo "TBS drivers set for x86 Linux 2.6.x"

./v4l/tbs-x86.sh
#./v4l/tbs-dvbc-x86.sh

# Enable some staging drivers
make stagingconfig

echo "TBS drivers building..."
make -j2

echo "TBS drivers installing..."
sudo rm -r -f /lib/modules/$(test $VER && echo $VER || uname -r)/kernel/drivers/media
sudo rm -r -f /lib/modules/$(test $VER && echo $VER || uname -r)/kernel/drivers/staging/media
sudo make install

echo "TBS drivers installation done"
echo "You need to reboot..."
