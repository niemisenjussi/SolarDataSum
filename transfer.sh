#!/bin/bash

# Transfers panel power data to other server every 20 sec

scp -i ~/.ssh/id_rsa_nopass /mnt/ramdisk/*.txt pi@192.168.1.19:/mnt/ramdisk
sleep 20
scp -i ~/.ssh/id_rsa_nopass /mnt/ramdisk/*.txt pi@192.168.1.19:/mnt/ramdisk
sleep 20
scp -i ~/.ssh/id_rsa_nopass /mnt/ramdisk/*.txt pi@192.168.1.19:/mnt/ramdisk
