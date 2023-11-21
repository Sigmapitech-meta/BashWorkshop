#!/usr/bin/env bash

sum=0

if [ -z "$1" ]
then
  echo "Error: missing argument"
  exit 1
fi

for file in *;
do
  count=$(cat $file | grep -o "$1" | wc -l)
  sum=$((sum + count))
  echo "$count fois in : $file"
done
echo "Soit $sum fois dans le dossier"
