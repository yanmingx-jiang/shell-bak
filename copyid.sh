#!/bin/bash
if [ ! -n "$1" ] ;then
    echo "please input copyid user@IP"
    # exit 1
    return
else
    echo "OK,plase wait!"
fi
user=$(echo $1|awk -F@ '{print $1}')
host=$(echo $1|awk -F@ '{print $2}')
ssh-keygen -R $host

ssh-copy-id $user@$host
