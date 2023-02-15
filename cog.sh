#!/bin/bash

TIMER="${TIMER-0}"
COG_PLATFORM_WL_VIEW_FULLSCREEN="${COG_PLATFORM_WL_VIEW_FULLSCREEN-0}"
COG_PLATFORM_WL_VIEW_WIDTH="${COG_PLATFORM_WL_VIEW_WIDTH-1280}"
COG_PLATFORM_WL_VIEW_HEIGHT="${COG_PLATFORM_WL_VIEW_HEIGHT-768}"

echo "Sleeping for $TIMER"
sleep $TIMER

INDEX=/var/run/secrets/index.html
if [ -f "$INDEX" ]; then
    echo "$INDEX exists."
else 
    echo "$INDEX does not exist."
    INDEX=/index.html
fi

IMAGE=/var/run/secrets/image.png
IMAGE_ROOT=/image.png
if [ -f "$IMAGE" ]; then
    echo "$IMAGE exists."
    echo "Coping $IMAGE to $IMAGE_ROOT"
    cp $IMAGE /image.png
else 
    echo "$IMAGE does not exist."
fi

echo "Index: $INDEX"

# Execute all the rest
echo "Starting Cog: $INDEX"
/usr/bin/cog "$INDEX"