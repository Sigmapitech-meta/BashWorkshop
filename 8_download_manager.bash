#!/usr/bin/env bash

download_dir="$HOME/Downloads"

for file in "$download_dir"/*;
do
    if [ ! -f "$file" ]; then
        continue
    fi

    if [[ "$file" =~ .*\.(zip|tar|gz|bz2|tgz) ]];
    then
        mkdir -p "$download_dir/archive"
        mv "$download_dir/$file" "$download_dir/archive/"
    fi
    if [[ "$file" =~ .*\.(pdf) ]];
    then
        mkdir -p "$download_dir/pdf"
        mv "$download_dir/$file" "$download_dir/pdf/"
    fi
    if [[ "$file" =~ .*\.(mp4|webm) ]];
    then
        mkdir -p "$download_dir/video"
        mv "$download_dir/$file" "$download_dir/video/"
    fi
    if [[ "$file" =~ .*\.(iso) ]];
    then
        mkdir -p "$download_dir/iso"
        mv "$download_dir/$file" "$download_dir/iso/"
    fi
    if [[ "$file" =~ .*\.(png|jpg|jpeg|svg) ]];
    then
        mkdir -p "$download_dir/img"
        mv "$download_dir/$file" "$download_dir/img/"
    fi

    mkdir -p "$download_dir/other"
    mv "$download_dir/$file" "$download_dir/other/"
done
