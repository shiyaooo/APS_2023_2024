#!/bin/bash

# Parcourir tous les fichiers .aps dans le répertoire spécifié
for file in ../Samples0/*.aps 
do
    echo "-----------------------------------------------"
    type=$(./prologTerm "$file" | swipl -s typage.pl -g main 2>&1)
    $file
    if [[ $type = *"void"* ]]; then
        echo "Type Checking OK."
    else 
        echo "Type Checking error!"
    fi
    res=$(./eval "$file")
    if [[ $res = "42" ]]; then
        echo "Eval Checking OK. Resut : 42."
    else 
        echo "Eval Checking ! Result: $res"
    fi
done
