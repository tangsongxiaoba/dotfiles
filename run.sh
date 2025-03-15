#!/bin/bash

set -e # quit in time when meet error

DOTFILES_DIR="$HOME/.dotfiles"

# if pwd is not DOTFILES_DIR, copy and overlay it and then cd into it.
if [[ "$PWD" != "$DOTFILES_DIR" ]]; then
    if [ -e "$DOTFILES_DIR" ] || [ -L "$DOTFILES_DIR" ]; then
        rm -rf "$DOTFILES_DIR"
    fi
    cp -r "$PWD" "$DOTFILES_DIR"
    cd "$DOTFILES_DIR"
fi


# create ignore file list
read_ignore_file() {
    local filename="$1"
    if [[ -f "$filename" ]]; then
        while IFS= read -r line || [ -n "$line" ]; do
            # 去掉前后空格
            local item
            item=$(echo "$line" | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')
            # 跳过空行或以 '#' 开头的注释行
            if [[ -z "$item" ]] || [[ "$item" == \#* ]]; then
                continue
            fi
            ignore_array+=("$item")
        done < "$filename" 
    fi
}

ignore_array=()
read_ignore_file ".ignore"
read_ignore_file ".ignore.local"

# to link file/folder to HOME
for item in *; do
    skip_item=false
    for ign in "${ignore_array[@]}"; do
        if [[ "$item" == "$ign" ]]; then
            skip_item=true
            break
        fi
    done
    if $skip_item; then
        continue
    fi

    src="$DOTFILES_DIR/$item"
    dst="$HOME/.$item"

    if [ -d "$src" ]; then

        # if has init.sh in the dir, exec it first
        if [ -f "$src/init.sh" ]; then
            bash "$src/init.sh"
        fi

        if [ -e "$dst" ] || [ -L "$dst" ]; then
            rm -rf "$dst"
        fi
        ln -s "$src" "$dst"
    else
        ln -sf "$src" "$dst"
    fi
done