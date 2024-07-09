#!/bin/bash

# Created by ags131, modified by ttom795

directory="/sys/kernel/config/usb_gadget/g2"
startdir=$PWD

if [ -d "$directory" ]; then
	usbipd -D --device
	usbip attach -r 0.0.0.0 -b usbip-vudc.0
	echo "USB device active"
	echo "Webpage on localhost"
	sudo nodejs index.js
else
	cd /sys/kernel/config/usb_gadget
	mkdir g2
	cd g2

	echo "0x0E6F" > idVendor
	echo "0x0241" > idProduct

	mkdir strings/0x409
	echo "P.D.P.000000" > strings/0x409/serialnumber
	echo "PDP LIMITED. " > strings/0x409/manufacturer
	echo "LEGO READER V2.10 (modified)" > strings/0x409/product

	mkdir functions/hid.g0
	echo 32 > functions/hid.g0/report_length
	echo -ne "\x06\x00\xFF\x09\x01\xA1\x01\x19\x01\x29\x20\x15\x00\x26\xFF\x00\x75\x08\x95\x20\x81\x00\x19\x01\x29\x20\x91\x00\xC0" > functions/hid.g0/report_desc

	mkdir configs/c.1
	mkdir configs/c.1/strings/0x409
	echo "LEGO READER V2.10 (modified)" > configs/c.1/strings/0x409/configuration 
	ln -s functions/hid.g0/ configs/c.1/

	name="$(ls /sys/class/udc)"
	echo "$name">UDC
	echo "USB device created (1st launch)"
	usbipd -D --device
	usbip attach -r 0.0.0.0 -b usbip-vudc.0
	echo "USB device active"
	cd "$startdir"
	echo "Webpage on localhost"
	sudo nodejs index.js
fi

