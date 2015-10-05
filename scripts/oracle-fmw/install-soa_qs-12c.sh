#!/bin/bash
mkdir /home/$OS_USER/.inventory
chown $OS_USER:$OS_GROUP -R /home/$OS_USER/.inventory

cat > /tmp/install.file <<EOF
[ENGINE]

#DO NOT CHANGE THIS.
Response File Version=1.0.0.0.0

[GENERIC]

#The oracle home location. This can be an existing Oracle Home or a new Oracle Home
ORACLE_HOME=$ORACLE_HOME
EOF

cat > /tmp/oraInst.loc <<EOF
inventory_loc=/home/$OS_USER/.inventory
inst_group=$OS_GROUP
EOF

cd $SOA_INSTALL_DIR
jar xf $SOA_ZIP
su $OS_USER -c "java -jar $SOA_PKG -ignoreSysPrereqs -novalidation -silent -responseFile /tmp/install.file -invPtrLoc /tmp/oraInst.loc -jreLoc $JAVA_HOME"


echo "ORACLE_HOME=$ORACLE_HOME; export ORACLE_HOME" >> /home/$OS_USER/.bash_profile
