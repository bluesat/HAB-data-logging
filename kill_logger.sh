#!/bin/bash

# ONLY RUN THIS SCRIPT IF YOU HAVE RUN THE start.sh SCRIPT FIRST
# This script will read the Process IDs saved by each python script and kill them one by one
# By Adithya Rajendran
# BLUEsat December 2017

file1="BMP280/.PID"
file2="DHT22/.PID"
file3="MPU9250/.PID"
file4="MAX31865/.PID"
file5="DS18B20/.PID"
file6="DS18B20/.PID2"
file7="CPUtemp/.PID"

if [ -f "$file1" ] && [ -f "$file2" ] && [ -f "$file3" ] && [ -f "$file4" ] && [ -f "$file5" ] && [ -f "$file6" ] && [ -f "$file7" ]
then
	echo "Killing loggers..."
else
	echo "Loggers have not been started. Type \"./start_logger.sh\" to start them. Or reboot the Pi using \"reboot\" if that does not work."
	exit 1
fi

read -r BMP_PID<$file1
kill $BMP_PID
echo "$BMP_PID was killed"

read -r DHT_PID<$file2
kill $DHT_PID
echo "$DHT_PID was killed"

read -r MPU_PID<$file3
kill $MPU_PID
echo "$MPU_PID was killed"

read -r MAX_PID<$file4
kill $MAX_PID
echo "$MAX_PID was killed"

read -r B20_PID<$file5
kill $B20_PID
echo "$B20_PID was killed"

read -r B20_PID2<$file6
kill $B20_PID2
echo "$B20_PID2 was killed"

read -r CPU_PID<$file7
kill $CPU_PID
rm -f $file7
echo "$CPU_PID was killed"

echo "
All loggers successfully killed."

./reset_LEDs.sh
