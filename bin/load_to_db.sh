#!/bin/sh
########################################
##### variables initialization #########
dumpDate=`date +%Y%m%d%H%M%S`
main_GeoIP_DIR=/u/debit/geo_ip
SqlLdr_DIR=$main_GeoIP_DIR/Oracle_Loader
########################################
########## DB Configuration ############
DBUser=geoip
DBPass=geoip
DBServiceType=RETAIL
########################################
############    MAIN    ################
date '+Started           : %Y.%m.%d %T'
echo "ProcessedFile     :       $SqlLdr_DIR/ipdata.out"
cd $SqlLdr_DIR
echo "Loading to DB ..."
(sqlldr userid=$DBUser/$DBPass@$DBServiceType control=$main_GeoIP_DIR/bin/load_to_db.ctl data=ipdata.out log=load.log bad=load.bad discard=load.dsc) | tail -1
sleep 1
date '+Loader ended      : %Y.%m.%d %T'
echo "Switch Synonyms ..."
(sqlplus -S -L $DBUser/$DBPass@$DBServiceType @$main_GeoIP_DIR/bin/switch_synonyms.sql)
date '+Switched          : %Y.%m.%d %T'
#echo "Removing dump files ..."
#echo "Removing Dump     :       ${dirToProcessedDump}/CreBalance_${dumpDate}.csv"
#rm -f ${dirToProcessedDump}/CreBalance_${dumpDate}.csv
#date '+Finished          : %Y.%m.%d %T'
echo "------------------------------------------------------------------------------------------"
