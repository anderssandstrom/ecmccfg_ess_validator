cfg_path=$1

source $cfg_path

echo "dbLoadRecords(ecmcMotorRecord.template, \"PREFIX=$prefix:, MOTOR_NAME=$axisname, MOTOR_PORT=MCU1, AXIS_NO=1, DESC=MCU1021 Lower Axis (1), EGU=mm, PREC=3, VELO=10.0, JVEL=5, JAR=0.0, ACCL=0.1, RDBD=0.1, DLLM=-20, DHLM=130, HOMEPROC=3,SREV=2000,UREV=60.000000, \")"
echo "dbLoadRecords(ecmcMotorRecordhome.template, \"PREFIX=$prefix:, MOTOR_NAME=$axisname, MOTOR_PORT=MCU1, AXIS_NO=1,HOMEPROC=3, HOMEPOS=0.0, HVELTO=5, HVELFRM=4, HOMEACC=21, HOMEDEC=100\")"
echo "dbLoadRecords(\"ecmcAxis.db\",\"P=$prefix:,AXIS_NAME=$axisname,AXIS_NO=1,PORT=MC_CPU1,ADDR=0,TIMEOUT=1,T_SMP_MS=10,TSE=-2\")"
echo "dbLoadRecords(\"ecmcAxisType.db\",\"P=$prefix:,AXIS_NAME=$axisname,AXIS_TYPE=1\")"
