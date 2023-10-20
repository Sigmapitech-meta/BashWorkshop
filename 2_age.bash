#!/bin/bash

read -p "Enter votre age: " -r num

if [[ "$num" =~ ^[0-9]+$ ]];
then
    if [ "$num" -lt 18 ];
    then
        echo "Vous êtes mineur"
    else
        echo "Vous êtes majeur"
    fi
else
    echo "Entrez une age valide!"
fi
