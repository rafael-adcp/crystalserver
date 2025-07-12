#!/bin/bash
ulimit -c unlimited
while true; do ./build/linux-release/bin/crystalserver 2>&1 | awk '{ print strftime("%F %T - "), 
$0; fflush(); }' | tee "logs/$(date +"%F %H-%M-%S.log")"; done
