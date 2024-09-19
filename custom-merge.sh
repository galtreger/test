#!/bin/bash

# Arguments:
# $1 = our file (current branch)
# $2 = base file (common ancestor)
# $3 = their file (incoming branch)

# Check if file exists in "ours" but not in "theirs"
if [ ! -e "$3" ] && [ -e "$1" ]; then
    echo "Keeping our file as theirs does not exist."
    cp $1 $1.merged

# Check if file exists in "theirs" but not in "ours"
elif [ -e "$3" ] && [ ! -e "$1" ]; then
    echo "Skipping addition of their file as it should not be added."
    cp $1 $1.merged

# Check if both files exist and there is no conflict
elif diff -q $1 $3 > /dev/null; then
    echo "Files are the same, keeping our version."
    cp $1 $1.merged

# Handle conflicting changes
else
    echo "Conflicting changes detected, keeping our version."
    cp $1 $1.merged
fi