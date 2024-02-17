#!/usr/bin/env bash

scd() {
    # Use 'find' to search for files and directories in the current directory,
    # filter them using 'fzf', and extract the directory part of the selected file's path

    # Check if fzf is installed
    if ! type fzf &>/dev/null; then
        echo "Error: 'fzf' is not installed. Please install it to use this function."
        return 1
    fi

    # Define a local variable 'selected_path'
    local selected_path

    # Note: './*' matches only files and directories in the current directory
    selected_path=$(find ./* 2>/dev/null | fzf --prompt="Select a file/directory to change to its directory: ")

    # Check if the selected path is a directory
    if [ -d "$selected_path" ]; then
        # If the selected path is a directory, change to that directory
        cd "$selected_path" || return 1
    else
        # If the selected path is a file, change to its directory
        cd "$(dirname "$selected_path")" || return 1
    fi
}

sfe() {
    # Use 'find' to search for files in the current directory and subdirectories,
    # filter them using 'fzf', and store the result in the 'file' variable

    # Check if fzf is installed
    if ! type fzf &>/dev/null; then
        echo "Error: 'fzf' is not installed. Please install it to use this function."
        return 1
    fi

    # Define a local variable 'file'
    local file

    # Note: './*' matches only files and directories in the current directory
    file=$(find ./* -type f 2>/dev/null | fzf --prompt="Select a file to open in default application: ")

    # Check if the 'file' variable is not empty
    if [[ -n "$file" ]]; then
        # Use 'xdg-open' to open the selected file with the default application,
        # suppress any output or error messages, run it in the background, and disown it
        { xdg-open "$file" >/dev/null 2>&1 & } &>/dev/null
        disown
    fi
}
