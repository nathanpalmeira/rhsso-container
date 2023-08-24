#!/bin/bash

# Download a single extension
download_extension() {
    echo $JBOSS_HOME
    local EXTENSION_URL="$1"

    if [[ -z "$EXTENSION_URL" ]]; then
        return
    fi

    echo
    echo "Downloading extension from $EXTENSION_URL"

    # Clean filename from query strings
    local FILE=${EXTENSION_URL##*/}
    FILE=/tmp/${FILE%%\?*}

    # Download file to tmp dir
    curl -Lk "$EXTENSION_URL" -o "$FILE"
    echo

    if [ -f "$FILE" ]; then
        echo "Installing $FILE to $JBOSS_HOME/standalone/deployments/ ..."
        cp -r "$FILE" $JBOSS_HOME/standalone/deployments/
        rm -f "$FILE"
    else
        ((STATUS+=1))
    fi
}

STATUS=0
for counter in $(seq 1 255) ; do
    declare -n ref="KEYCLOAK_EXTENSION_${counter}"
    if [[ -n "$ref" ]]; then
        download_extension "$ref"
    fi
done
if [ "$STATUS" -ne 0 ]; then
    echo
    echo -e "extensions.sh script failed at downloading all required extensions, number of failed downloads: $STATUS\n"
    exit 1
else
    echo
    echo -e "All extensions downloaded successfully.\n"
fi
