#!/bin/bash
#
# Since: October, 2014
# Author: quilcate.jorge@gmail.com
# Description: script to build a Docker image for Oracle SOA Suite

usage() {
cat << EOF
Usage: buildDockerImage.sh -m [Middleware Home]
Builds a Docker Image for SOA Suite.

Parameters:
   -m: Middleware Home directory
* using -m is mandatory.

LICENSE CDDL 1.0 + GPL 2.0
EOF
exit 0
}

# Validate packages
checksumPackages() {
  echo "Checking if required packages are present and valid..."
  md5sum -c Checksum.$DISTRIBUTION
  if [ "$?" -ne 0 ]; then
    echo "MD5 for required packages to build this image did not match!"
    exit $?
  fi
}

if [ "$#" -eq 0 ]; then usage; fi

# Parameters
DEVELOPER=1
MW_HOME=''
while getopts "hdm:" optname; do
  case "$optname" in
    "h")
      usage
      ;;
    "d")
      DEVELOPER=1
      ;;
    "m")
      MW_HOME="${OPTARG}"
      ;;
    *)
    # Should not occur
      echo "Unknown error while processing options inside buildDockerImage.sh"
      ;;
  esac
done

# WebLogic Image Names and Version
VERSION="12.1.3"
DEFAULT_IMAGE_NAME="oracle/soa:$VERSION"
DEFAULT_DEV_IMAGE_NAME="$DEFAULT_IMAGE_NAME-dev"

# Developer or Generic?
if [ $DEVELOPER -eq 1 ]; then
  DISTRIBUTION="developer"
  IMAGE_NAME="$DEFAULT_DEV_IMAGE_NAME"
else
  usage
fi

# Go into version folder
cd $VERSION

checksumPackages

echo "====================="

# ################## #
# BUILDING THE IMAGE #
# ################## #
echo "Building image '$IMAGE_NAME' based on '$DISTRIBUTION' distribution on Middleware Home '$MW_HOME'..."

# BUILD THE IMAGE (replace all environment variables)
rm -f Dockerfile && ln -s Dockerfile.$DISTRIBUTION Dockerfile
# docker build --force-rm=true --no-cache=true --rm=true -t $IMAGE_NAME .
docker build -t $IMAGE_NAME .
rm -f Dockerfile

if [ $? -ne 0 ]; then
  echo "There was an error building the image."
  exit $?
fi

sudo docker run -v ${MW_HOME}:/u01/oracle/soa -i oracle/soa:12.1.3-dev su oracle -c 'cd /u01 && java -jar $SOA_PKG -ignoreSysPrereqs -novalidation -silent -responseFile /u01/install.file -invPtrLoc /u01/oraInst.loc -jreLoc /usr/java/default && rm -rf $SOA_PKG $SOA_PKG2 /u01/oraInst.loc /u01/install.file'

echo ""

if [ $? -eq 0 ]; then
  echo "SOA Suite Docker Image for '$DISTRIBUTION' $VERSION is ready to be extended: $IMAGE_NAME"
else
  echo "SOA Suite Docker Image was NOT successfully created. Check the output and correct any reported problems with the docker build operation."
fi
