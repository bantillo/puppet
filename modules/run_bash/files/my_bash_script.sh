#!/bin/bash

echo "PHILIPP IS HERE"


_app_hostname=$(hostname -f)
APP_HOME=/opt/ddf-2.9.2

echo "$APP_HOME/etc/"

sed -i "s/localhost/$_app_hostname/" $APP_HOME/etc/system.properties

sed -i "s/localhost/$_app_hostname/g" $APP_HOME/etc/users.properties

sed -i "s/localhost/$_app_hostname/g" $APP_HOME/etc/users.attributes

sed -i "s/localhost/localhost\ $_app_hostname/" /etc/hosts
