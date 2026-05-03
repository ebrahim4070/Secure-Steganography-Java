#!/bin/bash
set -e
PORT="${PORT:-8080}"
echo "Starting Tomcat on port $PORT"
exec catalina.sh run -Dport.http.port="$PORT"
