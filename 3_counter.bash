#!/usr/bin/env bash

arg=$1
if [ -z "$1" ]
then
  echo "Error: missing argument"
  exit 1
fi

if [[ $arg =~ ^[0-9]+$ ]];
then
  for ((i=1; i<=arg; i++));
  do
    echo "$i"
  done
else
  echo "Error argument shouldbe a number"
fi
