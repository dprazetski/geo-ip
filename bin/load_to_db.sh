#!/bin/sh
########################################
##### variables initialization #########
. $HOME/.profile > /dev/null
dumpDate=`date +%Y%m%d%H%M%S`
main_GeoIP_DIR=/u/debit/geo_ip
SqlLdr_DIR=$main_GeoIP_DIR/Oracle_Loader
########################################
########## DB Configuration ############
DBUser=geoip
DBPass=geoip
DBHost=ex01-scan.prod.idt.net
DBServiceType=RETAIL
########################################
############    MAIN    ################
echo "##################################"
date '+Started           : %Y.%m.%d %T'
echo "ProcessedFile     :       $SqlLdr_DIR/ipdata.out"
cd $SqlLdr_DIR
echo "Dir changed to `pwd`"
echo "##################################"
echo "Loading to DB ..."
# (sqlplus -S -L ${DBUser}/${DBPass}@//${DBHost}/${DBServiceType} @${dirToCTL}/truncate_CRE_BALANCE_DUMP3.sql)
# (sqlplus -S -L ${DBUser}/${DBPass}@//${DBHost}/${DBServiceType} @${dirToCTL}/analize_CRE_BALANCE.sql)
for i in $SqlLdr_DIR/ipdata.out
do
  csvName=`basename ${i%.*}`
  name=${csvName%_*}
  echo "Start with File   :       $csvName"
  (sqlldr userid=${DBUser}/${DBPass}@//${DBHost}/${DBServiceType} control=$SqlLdr_DIR/load.ctl data=${i} log=$SqlLdr_DIR/load.log bad=$SqlLdr_DIR/load.bad discard=$SqlLdr_DIR/load.dsc) | tail -1
done
sleep 1
echo "##################################"
date '+Loader ended      : %Y.%m.%d %T'
#echo "Analize tables ..."
#(sqlplus -S -L ${DBUser}/${DBPass}@//${DBHost}/${DBServiceType} @${dirToCTL}/analize_CRE_BALANCE.sql)
#date '+Analized          : %Y.%m.%d %T'
#echo "Removing dump files ..."
#echo "Removing Dump     :       ${dirToProcessedDump}/CreBalance_${dumpDate}.csv"
#rm -f ${dirToProcessedDump}/CreBalance_${dumpDate}.csv
#date '+Finished          : %Y.%m.%d %T'
echo "------------------------------------------------------------------------------------------"
