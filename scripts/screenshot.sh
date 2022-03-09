#!/bin/bash

FILENAME=$(date +%s)_$(date +%d.%m.%y_%H:%M).png


import ~/Screenshot/$FILENAME

xclip -selection clipboard -t image/png -i ~/Screenshot/$FILENAME