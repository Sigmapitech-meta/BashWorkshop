#!/usr/bin/env bash

read -p "Type de commits: " -r type
read -p "Fichier concernées: " -r file
read -p "Message: " -r message

file_f=${file// /, }

echo "git add $file"
echo -e "git commit -m \"$type ($file_f): $message\" &&\n git push"

read -p "Executer ? (y/n)" -r exec

if [ "$exec" = "y" ]; then
    git add "$file"
    git commit -m "$type ($file_f): $message" && git push
    echo "Success"
else
    echo "Aborted"
fi
