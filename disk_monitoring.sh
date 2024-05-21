#!/bin/bash

THRESHOLD=95

DISK_USAGE=$(df -h | grep 'sda1\b' | awk '{print $5}' | sed 's/%//')

if [ "$DISK_USAGE" -ge "$THRESHOLD" ]
then
        echo "Внимание! Дисковое пространство переполнено ($DISK_USAGE%)"
else
        echo "Дисковое пространство в норме ($DISK_USAGE%)"
fi
