#!/usr/bin/env bash

function getPercentage() {
	local -r BASE_NUMBER=$1
	local -r PERCENTAGE=$2

	local -r LEVEL_ONE_PERCENT_WHOLE_PART="$((BASE_NUMBER / 100))"
	local -r LEVEL_ONE_PERCENT_DECIMAL_PART="$((BASE_NUMBER % 100))"
	local -r LEVEL_WHOLE_PART="$((LEVEL_ONE_PERCENT_WHOLE_PART * PERCENTAGE))"
	local -r LEVEL_DECIMAL_PART="$((LEVEL_ONE_PERCENT_DECIMAL_PART * PERCENTAGE / 100))"
	local -r RESULT="$((LEVEL_WHOLE_PART + LEVEL_DECIMAL_PART))"
	echo -e "${RESULT}"
}

function changeBacklight() {
	local -r BACKLIGHT_DIRECTORY_NAME="/sys/class/backlight"
	local -r MAX_BRIGHTNESS_FILE_NAME="max_brightness"
	local -r BRIGHTNESS_FILE_NAME="brightness"

	local -r BACKLIGHT_MODULE_NAME=$1

	local -r MAX_BRIGHTNESS_FILE_PATH="${BACKLIGHT_DIRECTORY_NAME}/${BACKLIGHT_MODULE_NAME}/${MAX_BRIGHTNESS_FILE_NAME}"
	local -r BRIGHTNESS_FILE_PATH="${BACKLIGHT_DIRECTORY_NAME}/${BACKLIGHT_MODULE_NAME}/${BRIGHTNESS_FILE_NAME}"

	if [[ -f "${MAX_BRIGHTNESS_FILE_PATH}" && -f "${BRIGHTNESS_FILE_PATH}" ]]; then
		brightness_changed=true
		local -r MAX_BRIGHTNESS=$(cat "${MAX_BRIGHTNESS_FILE_PATH}")
		local -r BACKLIGHT_PERCENTAGE_NUMBER=$(getPercentage "${MAX_BRIGHTNESS}" "${LEVEL}")
		echo -e "${GREEN}[info]:${CLEAR} Setting '${YELLOW}${BACKLIGHT_MODULE_NAME}${CLEAR}' brightness to ${CYAN}${BACKLIGHT_PERCENTAGE_NUMBER}${CLEAR}/${CYAN}${MAX_BRIGHTNESS}${CLEAR} (${CYAN}${LEVEL}%${CLEAR})"
		echo -e "${BACKLIGHT_PERCENTAGE_NUMBER}" | sudo tee "${BRIGHTNESS_FILE_PATH}" >/dev/null
	else
		echo -e "${GREEN}[info]:${CLEAR} '${YELLOW}${BACKLIGHT_MODULE_NAME}${CLEAR}' necessary info missing. Skipping"
	fi
}

function runBacklightUpdateBatch() {
	local -r IGPU_BACKLIGHT_MODULE_NAME="amdgpu_bl0"
	local -r DGPU_BACKLIGHT_MODULE_NAME="nvidia_0"

	changeBacklight "${IGPU_BACKLIGHT_MODULE_NAME}"
	changeBacklight "${DGPU_BACKLIGHT_MODULE_NAME}"
}

# Color table
RED="\033[0;31m"
GREEN="\033[0;32m"
YELLOW="\033[0;33m"
BLUE="\033[0;34m"
CYAN="\033[0;36m"
CLEAR="\033[0m"

# Manual
SYNTAX=$"Specify brightness '${YELLOW}level${CLEAR}' - range from ${CYAN}0${CLEAR} to ${CYAN}100${CLEAR}"

# Check if is run as a root
if [ "${EUID}" != 0 ]; then
	echo -e "${RED}[error]:${CLEAR} This needs to be run as a root"
	exit 1
fi

LEVEL=$1

# State tracking
brightness_changed=false

if [[ -z "${LEVEL}" || "${LEVEL}" -gt 100 || "${LEVEL}" -lt 0 ]]; then
	echo -e "${SYNTAX}"
	exit 1
fi

runBacklightUpdateBatch

if [ "${brightness_changed}" = true ]; then
	echo -e "${GREEN}[info]:${CLEAR} Screen brightness level set to ${CYAN}${LEVEL}%${CLEAR}"
	exit 0
else
	echo -e "${RED}[error]:${CLEAR} Unable to update brightness level"
	exit 1
fi
