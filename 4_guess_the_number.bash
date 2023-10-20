#!/bin/bash

random_number=$(((RANDOM % 100) + 1))
guess=-1
i=0

while [ $guess -ne $random_number ]
do
  read -p "Guess the number: " -r guess
  if [ "$guess" -lt $random_number ]
  then
    echo "C'est plus"
  elif [ "$guess" -gt $random_number ]
  then
    echo "C'est moins"
  fi
  i=$((i + 1))
done
echo "Felicitation vous avez trouvé en $i essais"