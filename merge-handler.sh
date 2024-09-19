#!/bin/bash
   LOGFILE="./logfile.log"

   log_action() {
     local message="$1"
     echo "$(date '+%Y-%m-%d %H:%M:%S') - $message" >> "$LOGFILE"
   }

   # Process each file specified between arguments $()
   for file in "$@"; do
     # Example: log each file
     log_action "Handling file: $file"

     # Add your custom file processing logic here
     # For example, you might copy the file somewhere or modify it
   done