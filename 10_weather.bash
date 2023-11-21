#!/usr/bin/env bash

echo -ne "Retrieving meteo...\r"

ip=$(curl -s https://api.ipify.org)
loc=$(curl -s https://ipapi.co/$ip/city)

meteo=$(curl -s https://wttr.in/$loc)

echo "$meteo" | head -n -3
