#!/bin/bash
mkdir /u01
chmod a+xr /u01
useradd -b /u01 -m -s /bin/bash oracle

sed -i '/.*EOF/d' /etc/security/limits.conf
echo "* soft nofile 16384" >> /etc/security/limits.conf
echo "* hard nofile 16384" >> /etc/security/limits.conf
echo "# EOF"  >> /etc/security/limits.conf

echo "net.core.rmem_max=4192608" > /u01/oracle/.sysctl.conf
echo "net.core.wmem_max=4192608" >> /u01/oracle/.sysctl.conf
sysctl -e -p /u01/oracle/.sysctl.conf
