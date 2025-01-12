#!/usr/bin/env bash

LOG_FILE="/opt/user.log"

sudo yum install nginx -y  &>> $LOG_FILE

sudo rm -rf /usr/share/nginx/html/*  &>> $LOG_FILE

sudo echo "<h1> This is server1 </h1>" > /usr/share/nginx/html/index.html &>> $LOG_FILE

sudo systemctl start nginx &>> $LOG_FILE

sudo systemctl enable  nginx &>> $LOG_FILE
