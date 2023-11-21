#!/usr/bin/env bash

threshold=$1
download_dir="$HOME/Downloads"
now=$(date +%s)

if [ -z "$threshold" ]
then
  echo "Error: missing argument"
  exit 1
fi

for file in "$download_dir"/*;
do
    if [ -d "$file" ]; then
        continue
    fi
    file_age=$(date -r "$download_dir/$file" +%s)
    diff=$(((now - file_age) / 86400))

    if [ $diff -gt "$threshold" ];
    then
        echo "$file has not been modified in $diff days."
        read -p "Delete $file?" -r conf
        if [ "$conf" = "y" ];
        then
            rm "$download_dir/$file"
            echo "$file has been deleted."
        fi
    fi
done
