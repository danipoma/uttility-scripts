#!/usr/bin/env bash
# set error settings
set -eo pipefail

## Color table
RED="\033[0;31m"
GREEN="\033[0;32m"
YELLOW="\033[0;33m"
BLUE="\033[0;34m"
CYAN="\033[0;36m"
CLEAR="\033[0m"

# Check if is run as a root
if [ "${EUID}" != 0 ]; then
    echo -e "${RED}[error]:${CLEAR} This needs to be run as a root"
    exit 1
fi

## Variables
IWD_CONFIG_DIRECTORY_PATH="/etc/NetworkManager/conf.d"
IWD_CONFIG_FILE_NAME="iwd.conf"
IWD_CONFIG_FILE_PATH="${IWD_CONFIG_DIRECTORY_PATH}/${IWD_CONFIG_FILE_NAME}"

if [ -d "${IWD_CONFIG_DIRECTORY_PATH}" ]; then
    echo -e $"${GREEN}[info]:${CLEAR} Installing iwd backend"
    sudo apt install -y iwd

    echo -e $"${GREEN}[info]:${CLEAR} Stopping NetworkManager"
    sudo systemctl stop NetworkManager

    echo -e $"${GREEN}[info]:${CLEAR} Disabling old NetworkManager backend (wpa_supplicant)"
    sudo systemctl disable wpa_supplicant.service

    echo -e $"${GREEN}[info]:${CLEAR} Stopping old NetworkManager backend (wpa_supplicant)"
    sudo systemctl stop wpa_supplicant.service

    echo -e $"${GREEN}[info]:${CLEAR} Masking old NetworkManager backend (wpa_supplicant)"
    sudo systemctl mask wpa_supplicant.service

    echo -e $"${GREEN}[info]:${CLEAR} Creating iwd configuration file"
    sudo touch "${IWD_CONFIG_FILE_PATH}"

    echo -e $"${GREEN}[info]:${CLEAR} Setting up configuration in iwd configuration file"
    echo "[device]" | sudo tee "${IWD_CONFIG_FILE_PATH}" >/dev/null
    echo "wifi.backend=iwd" | sudo tee -a "${IWD_CONFIG_FILE_PATH}" >/dev/null

    echo -e $"${GREEN}[info]:${CLEAR} Removing old connections made by wpa_supplicant backend"
    sudo rm -f /etc/NetworkManager/system-connections/*.nmconnection

    echo -e $"${GREEN}[info]:${CLEAR} Enabling iwd backend"
    sudo systemctl enable iwd.service

    echo -e $"${GREEN}[info]:${CLEAR} Starting iwd backend"
    sudo systemctl start iwd.service

    echo -e $"${GREEN}[info]:${CLEAR} Restarting NetworkManager"
    sudo systemctl restart NetworkManager
else
    echo -e $"${RED}[error]:${CLEAR} ${IWD_CONFIG_DIRECTORY_PATH} directory not found"
    echo -e $"${GREEN}[info]:${CLEAR} No change will occur"
    exit 1
fi
