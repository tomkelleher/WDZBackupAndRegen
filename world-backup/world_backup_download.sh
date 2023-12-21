#!/bin/bash

# Define screen session name
SCREEN_SESSION="ftp_download"

# FTP credentials and server IP
USERNAME="yourUsername"
PASSWORD="yourPassword"
SERVER_IP="server-ip"

# Directory to save the downloaded file
SAVE_DIR="/path/to/save/directory"

# File to download
FILE_TO_DOWNLOAD="world.zip"

# Generate the current date in the format YYYYMMDD-HHMMSS
CURRENT_DATE=$(date +"%Y%m%d-%H%M%S")

# New file name with date stamp
NEW_FILE_NAME="${FILE_TO_DOWNLOAD%.*}-${CURRENT_DATE}.zip"

# Start a detached screen session
screen -dmS $SCREEN_SESSION

# Run lftp command inside the screen session
screen -S $SCREEN_SESSION -X stuff "lftp -u $USERNAME,$PASSWORD $SERVER_IP -e 'get $FILE_TO_DOWNLOAD -o ${SAVE_DIR}/${NEW_FILE_NAME}; bye'\n"

echo "File download initiated in screen session: $SCREEN_SESSION"