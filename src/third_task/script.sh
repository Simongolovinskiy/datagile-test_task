#!/bin/bash

backup_dir="/etc/bkp"
mkdir -p $backup_dir

for dir in /etc/cron*; do
    if [ -d "$dir" ]; then
        dirname=$(basename $dir)
        tar -czf $backup_dir/$dirname.tar.gz -C /etc $dirname
    fi
done
