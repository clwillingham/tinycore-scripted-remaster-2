#!/bin/sh
# put other system startup commands here
sleep 3
mv /home/tc/.wmx /home/tc/.wmx_old
cp -r /home/tc/.mymenu/.wmx /home/tc/.wmx
