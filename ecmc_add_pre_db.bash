#! /bin/bash

# source config
source $1


# Print start of statrtup file
#echo "epicsEnvSet(\"ECMC_DEV_MODE\",1)"
#echo "epicsEnvSet(\"IOC\" ,\"\$(IOC=\"${prefix}\")\")"
#echo "epicsEnvSet(\"ECMCCFG_INIT\" ,\"\")"
#echo "epicsEnvSet(\"SCRIPTEXEC\" ,\"\$(SCRIPTEXEC=\"iocshLoad\")\")"
echo "require ecmccfg ${ecmccfgver}"
#echo "\$(ECMCCFG_INIT)\$(SCRIPTEXEC) \${ecmccfg_DIR}startup.cmd, \"IOC=\$(IOC),ECMC_VER=${ecmcver},NAMING=ESSnaming\""
