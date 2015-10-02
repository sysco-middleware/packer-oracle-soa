#!/usr/bin/env bash

rpm -i $JAVA_RPM
rm $JAVA_RPM

echo "export JAVA_HOME=/usr/java/default" > /etc/profile.d/jdk.sh
echo "export PATH=${JAVA_HOME}/bin:${PATH}" >> /etc/profile.d/jdk.sh
