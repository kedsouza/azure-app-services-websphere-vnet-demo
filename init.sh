#!/bin/bash

# starting sshd process
sed -i "s/SSH_PORT/$SSH_PORT/g" /etc/ssh/sshd_config
mkdir /run/sshd
/usr/sbin/sshd

# specfying the Java options to use the PORT environment variable.
export IBM_JAVA_OPTIONS="$IBM_JAVA_OPTIONS -Dport.http=$PORT"

./opt/ibm/helpers/runtime/docker-server.sh /opt/ibm/wlp/bin/server run