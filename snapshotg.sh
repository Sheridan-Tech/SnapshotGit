#!/bin/bash
# Take a snapshot of your git changes and stash them
# James Sheridan 
# Sheridan Technologies Copyright 2020

git add .

# if there are input parameters use all of them as the text for the message
if [ "$#" -ne 0 ]
then
    git stash save "$@"
else
    git stash
fi


if [ $? ]
then
    git stash apply

    if [ $? ]
    then
        echo -e "\nGit snapshot successful\n"
    else
        echo -e "\nFailed to apply stash!\n"
    fi
else
    echo -e "\nFailed to stash work!\n"
fi
