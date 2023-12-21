#!/bin/bash

# Path to the configuration file
CONFIG_FILE="config.cfg"

# Check if configuration file exists
if [ ! -f "$CONFIG_FILE" ]; then
    echo "Configuration file not found: $CONFIG_FILE"
    exit 1
fi

# Source the configuration file
source "$CONFIG_FILE"

# Generate the current date in the format YYYYMMDD-HHMMSS
CURRENT_DATE=$(date +"%Y%m%d-%H%M%S")

# New file name with date stamp
NEW_FILE_NAME="${FILE_TO_DOWNLOAD%.*}-${CURRENT_DATE}.zip"

# Start a detached screen session
screen -dmS $SCREEN_SESSION

# Run lftp command inside the screen session
screen -S $SCREEN_SESSION -X stuff "lftp -u $USERNAME,$PASSWORD $SERVER_IP -e 'get $FILE_TO_DOWNLOAD -o ${SAVE_DIR}/${NEW_FILE_NAME}; bye'\n"

echo "File download initiated in screen session: $SCREEN_SESSION"
