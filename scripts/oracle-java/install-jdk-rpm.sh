#!/bin/bash
yum install curl -y
curl -v -j -k -L -H "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/$JDK_VERSION-$JDK_BUILD/jdk-$JDK_VERSION-linux-x64.rpm -o jdk-$JDK_VERSION-linux-x64.rpm
rpm -i jdk-$JDK_VERSION-linux-x64.rpm

cat > /etc/profile.d/jdk.sh <<EOF
export JAVA_HOME=$JAVA_HOME
export PATH=${JAVA_HOME}/bin:${PATH}
EOF
