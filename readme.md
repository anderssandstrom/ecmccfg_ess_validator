# Validator for ecmccfg pv names
This first version only supports checking property length

## Example
```
#source env first since iocsh is automatically executed:
. ~/epics/base-7.0.5/require/3.4.0/bin/setE3Env.bash

# Execute check
bash ecmc_main_check_db.bash settings.cfg | tee test.log
```

Example settings file:
```
dirs=(Baumer Beckhoff_1XXX Beckhoff_2XXX Beckhoff_3XXX Beckhoff_4XXX Beckhoff_5XXX Beckhoff_6XXX Beckhoff_7XXX Beckhoff_9XXX Beckhoff_AMI Beckhoff_couplers Beckhoff_KL Beckhoff_slaves Keyence Kuhnke_slaves MicroEpsilon_slaves MonoDAQ SmarAct Technosoft_slaves)
ecmcver="7.0.1"
ecmccfgver="7.0.1"
ecmccfgpath="/home/iocuser/sources/e3/ecat/e3-ecmccfg/ecmccfg"
prefix="ECMC_TEST_PREFIX"
outputfile="pvs.log"
axisname="Axis1"
naming="ESSnaming"
maxproplength=25
```
