#!/bin/bash
# Bash script to control the monitor brightness
# Put into /usr/bin/ and add chmod +x

function getPercentage() {
	local baseNumber=$1
	local percentage=$2

	local LEVEL_ONE_PERCENT_WHOLE_PART="$(( $baseNumber / 100 ))"
	local LEVEL_ONE_PERCENT_DECIMAL_PART="$(( $baseNumber % 100 ))"
	local LEVEL_WHOLE_PART="$(( $LEVEL_ONE_PERCENT_WHOLE_PART * $percentage ))"
	local LEVEL_DECIMAL_PART="$(( $LEVEL_ONE_PERCENT_DECIMAL_PART * $percentage / 100 ))"
	local RESULT="$(( $LEVEL_WHOLE_PART + $LEVEL_DECIMAL_PART ))"
	echo $RESULT
}

# Check if is run as a root
if [ $EUID != 0 ]; then
	echo "This needs to be run as a root"
	exit 0
fi
SYNTAX="\\n \\t SYNTAX:  dimmer level \\n \\t Where 'level' ranges from 0 to 100.\\n";

LEVEL=$1
if [ $LEVEL -gt 100 ]; then
    echo -e $SYNTAX;
    exit 1;
fi

if [ $LEVEL -lt 0 ]; then
    echo -e $SYNTAX;
    exit 1;
fi

cd /sys/class/backlight/


if [[ -f amdgpu_bl0/max_brightness && -f amdgpu_bl0/brightness ]];
then
	MAX_BRIGHTNESS=$(cat amdgpu_bl0/max_brightness)
	BACKLIGHT_PERCENTAGE_NUMBER=$(getPercentage $MAX_BRIGHTNESS $LEVEL)
	echo "[info]: Setting amdgpu_bl0 brightness to "$BACKLIGHT_PERCENTAGE_NUMBER"/"$MAX_BRIGHTNESS" for ("$LEVEL"%)"
	sudo echo $BACKLIGHT_PERCENTAGE_NUMBER > amdgpu_bl0/brightness
else
	echo "amdgpu_bl0 necessary info missing. Skipping"
fi


if [[ -f nvidia_0/max_brightness && -f nvidia_0/brightness ]];
then
	MAX_BRIGHTNESS=$(cat nvidia_0/max_brightness)
	BACKLIGHT_PERCENTAGE_NUMBER=$(getPercentage $MAX_BRIGHTNESS $LEVEL)
	echo "[info]: Setting nvidia_0 brightness to "$BACKLIGHT_PERCENTAGE_NUMBER"/"$MAX_BRIGHTNESS" for ("$LEVEL"%)"
	sudo echo $BACKLIGHT_PERCENTAGE_NUMBER > nvidia_0/brightness
else
	echo "nvidia_0 necessary info missing. Skipping"
fi

echo -e "[info]: Screen Brightness level set to" $LEVEL"%"
