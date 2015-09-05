# HOW TO BUILD THIS IMAGE
# -----------------------
# Put all downloaded files in the same directory as this Dockerfile
# Run:
#      $ docker build -t soa_host .
#

# Pull base image
# ---------------
FROM jeqo/oracle-soa-12c:12.1.3-dev

# Maintainer
# ----------
MAINTAINER Jorge Quilcate <quilcate.jorge@gmail.com>

# WLS Configuration
# -------------------------------
ENV JAVA_HOME /usr/java/default
ENV ADMIN_PASSWORD welcome1
ENV ADMIN_PORT 7001
ENV OSB_DEBUG_PORT 7453
ENV SOA_DEBUG_PORT 5004
ENV USER_MEM_ARGS -Xms1024m -Xmx2058m -XX:MaxPermSize=1024m

# Add files required to build this image
COPY container-scripts/* /u01/oracle/

# Configuration of SOA Domain
USER oracle
WORKDIR /u01/oracle/soa
RUN /u01/oracle/soa/wlserver/common/bin/wlst.sh -skipWLSModuleScanning /u01/oracle/create-soa-domain.py

# Expose Node Manager default port, and also default http/https ports for admin console
EXPOSE $ADMIN_PORT $OSB_DEBUG_PORT $SOA_DEBUG_PORT

# Final setup
WORKDIR /u01/oracle

ENV PATH $PATH:/u01/oracle/soa/wlserver/common/bin:/u01/oracle/work/domains/soa_domain/bin:/u01/oracle

# Define default command to start bash.
CMD ["sh", "/u01/oracle/work/domains/soa_domain/startWebLogic.sh"]
