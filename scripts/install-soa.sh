#!/bin/bash
mkdir /u01/oracle/.inventory
chown oracle:oracle -R /u01
cd /u01
jar xf $SOA_ZIP
su oracle -c "java -jar $SOA_PKG -ignoreSysPrereqs -novalidation -silent -responseFile /u01/install.file -invPtrLoc /u01/oraInst.loc -jreLoc $JAVA_HOME"
rm -rf $SOA_PKG $SOA_PKG2 /u01/oraInst.loc /u01/install.file
