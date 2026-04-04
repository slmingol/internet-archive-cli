#!/bin/sh

if [ $# -eq 0 ]; then
    echo "Internet Archive Downloader"
    echo "==========================="
    echo ""
    echo -n "Enter the Archive.org item ID to download: "
    read ITEM_ID
    
    if [ -z "$ITEM_ID" ]; then
        echo "Error: No item ID provided"
        exit 1
    fi
    
    echo ""
    echo "Downloading: $ITEM_ID"
    exec ia download "$ITEM_ID"
else
    exec ia "$@"
fi
