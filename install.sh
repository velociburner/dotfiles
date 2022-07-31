#!/usr/bin/env bash

set -e
set -o pipefail

cd $(dirname $0)

# dotfiles
for fname in .[^.\(git\)]*; do
    # if for some reason the file does not exist, skip it
    if [ ! -f ${fname} ]; then
        continue
    fi

    # if the link already exists, skip it
    if [ -h ${HOME}/${fname} ]; then
        echo "Link to ${HOME}/${fname} already exists"
        continue
    fi

    # if there is already a file in the home directory, prompt user
    if [ -f ${HOME}/${fname} ]; then
        echo "${HOME}/${fname} already exists. Would you like to overwrite it? [y/N]"
        read choice
        if [[ ${choice} =~ ^([nN][oO]?|)$ ]]; then
            echo "Skipping ${fname}"
            continue
        else
            rm ${HOME}/${fname}
            echo "Removed ${HOME}/${fname}"
        fi
    fi

    ln -s ${PWD}/${fname} ${HOME}/${fname}
    echo "Created link ${HOME}/${fname} -> ${PWD}/${fname}"
done

echo

# if there is no config foler, create it first
if [ ! -d ${HOME}/.config ]; then
    mkdir ${HOME}/.config
    echo "Created folder ${HOME}/.config/"
fi

# config folders
for dname in *; do
    # if for some reason the folder does not exist, skip it
    if [ ! -d ${dname} ]; then
        continue
    fi

    # if the link already exists, skip it
    if [ -h ${HOME}/.config/${dname} ]; then
        echo "Link to ${HOME}/${dname}/ already exists"
        continue
    fi

    # if there is already a folder in the home directory, prompt user
    if [ -d ${HOME}/.config/${dname} ]; then
        echo "${HOME}/${dname} already exists. Would you like to overwrite it? [y/N]"
        read choice
        if [[ ${choice} =~ ^([nN][oO]?|)$ ]]; then
            echo "Skipping ${dname}/"
            continue
        else
            if [ -z "$(ls -A ${HOME}/.config/${dname}/ )" ]; then
                rmdir ${HOME}/.config/${dname}
                echo "Removed ${HOME}/.config/${dname}/"
            else
                echo "${HOME}/.config/${dname}/ is not empty. Please check its contents manually."
                continue
            fi
        fi
    fi

    ln -s ${PWD}/${dname} ${HOME}/.config/${dname}
    echo "Created link ${HOME}/.config/${dname}/ -> ${PWD}/${dname}/"
done

echo
echo "Done!"
