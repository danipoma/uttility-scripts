#!/usr/bin/env bash

## Color table
RED="\033[0;31m"
GREEN="\033[0;32m"
YELLOW="\033[0;33m"
BLUE="\033[0;34m"
CYAN="\033[0;36m"
CLEAR="\033[0m"

## Manual
SYNTAX=$"Specify '${YELLOW}battery mode${CLEAR}'\\n- ${CYAN}1${CLEAR} for conservation mode ${GREEN}activation${CLEAR} (${CYAN}60%${CLEAR})\\n- ${CYAN}0${CLEAR} for conservation mode ${RED}deactivation${CLEAR} (${CYAN}100%${CLEAR})"

BATTERY_DIRECTORY_NAME="/sys/devices/pci0000:00/0000:00:14.3/PNP0C09:00/VPC2004:00"
CONSERVATION_MODE_FILE_NAME="conservation_mode"

CONSERVATION_MODE_FILE_PATH="${BATTERY_DIRECTORY_NAME}/${CONSERVATION_MODE_FILE_NAME}"

MODE=$1

# Check if is run as a root
if [ "${EUID}" != 0 ]; then
	echo -e "${RED}[error]:${CLEAR} This needs to be run as a root"
	exit 1
fi

if [[ -z "${MODE}" || "${MODE}" -gt 1 || "${MODE}" -lt 0 ]]; then
	echo -e "${SYNTAX}"
	exit 1
fi

if [ -f "${CONSERVATION_MODE_FILE_PATH}" ]; then
	echo -e "${MODE}" | sudo tee "${CONSERVATION_MODE_FILE_PATH}" >/dev/null
else
	echo -e $"${RED}[error]:${CLEAR} Conservative mode location not found"
	echo -e $"${GREEN}[info]:${CLEAR} No change will occur"
	exit 1
fi

if [ "${MODE}" -eq 0 ]; then
	echo -e $"${GREEN}[info]:${CLEAR} Conservative mode ${RED}disabled${CLEAR}"
	echo -e $"${GREEN}[info]:${CLEAR} Battery should charge up to ${CYAN}100%${CLEAR}"
else
	echo -e $"${GREEN}[info]:${CLEAR} Conservative mode ${GREEN}enabled${CLEAR}"
	echo -e $"${GREEN}[info]:${CLEAR} Battery should charge maximally up to ${CYAN}60%${CLEAR}"
fi

exit 0
