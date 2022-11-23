#!/bin/bash


nb_file=$(ls -l | grep -c "^-")
nb_file_last=$(ls -l .. | grep -c "^-")

sum=$((nb_file + nb_file_last))

echo "Il y a $nb_file dans le dossier, $nb_file_last" \
"dans le précédent, soit un total de $sum fichiers."
