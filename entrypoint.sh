#!/bin/bash
# Railway sets the PORT variable dynamically
# We update Tomcat's server.xml to use this port
echo "Starting with PORT=${PORT:-8080}"
sed -i "s/port=\"8080\"/port=\"${PORT:-8080}\"/g" /usr/local/tomcat/conf/server.xml
exec catalina.sh run
