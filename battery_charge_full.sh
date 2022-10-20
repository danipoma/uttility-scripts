#!/bin/bash

function battery_charge_full(){
	# Check if is run as a root
	if [ $EUID != 0 ]; then
		echo "This needs to be run as a root"
		return 0
	fi

	# For some reason if I am not in folder structure, my change gets denied
	cd /sys/devices/pci0000:00/0000:00:14.3/PNP0C09:00/VPC2004:00

	if [ -f conservation_mode ];
	then
		echo 0 > conservation_mode
		echo "Conservative Mode disabled."
		echo "Battery should charge up to 100%."
	else
		echo "Conservative Mode file was not found."
		echo "No change will occur."
	fi

	exit
}


battery_charge_full
