#!/bin/bash

# bin/init.sh
# to chmod executable files in the dir.
for file in *; do
    if [ -f "$file" ]; then
        if file "$file" | grep -Eiq 'executable|ELF|shell script'; then
            chmod 755 "$file"
        fi
    fi
done