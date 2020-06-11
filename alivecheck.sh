#!/bin/bash
NGINX_CHECK=`pgrep nginx | wc -l`
if [ ${NGINX_CHECK} = 0 ]
then
        echo "nginx is dead"
        sudo systemctl start nginx
        echo "nginx start"
else
        echo "nginx is running"
fi