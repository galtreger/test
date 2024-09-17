#!/bin/sh

# %O = ancestor version (common base of merge)
# %A = current branch version (ours)
# %B = other branch version (theirs)

# The script is expected to return a 0 exit status if it successfully
# merges the files and a non-zero exit status otherwise.

# Check if the stacktic-stag directory exists in ours
if [ -d "$2/test/" ]; then
    # Do nothing, just copy the current (ours) version
    cp -r $2/test/* $2/
else
    # If it doesn't exist in ours, fallback to the common ancestor version
    cp -r $1/test/* $2/ || true
fi

# Always succeed the custom merge
exit 0