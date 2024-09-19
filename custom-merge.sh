#!/bin/bash

# Arguments:
# $1 = our file (current branch)
# $2 = base file (common ancestor)
# $3 = their file (incoming branch)

# If file exits in "ours", keep it
if [ -e "$1" ]; then
    cp "$1" "$2"
# Otherwise don't merge anything
else
    rm -f "$2"
fi