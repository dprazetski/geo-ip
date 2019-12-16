#!/bin/sh
########################################
##### variables initialization #########
MAIN_GEOIP_DIR=/u/debit/geo_ip
SQLLDR_DIR=$MAIN_GEOIP_DIR/oracle_loader
########################################
########## DB Configuration ############
DBUSER=geoip
DBPASS=geoip
DBSERVICETYPE=RETAIL
########################################
############    MAIN    ################
date '+Started           : %Y.%m.%d %T'
echo "ProcessedFile     : $SQLLDR_DIR/ipdata.out"
cd $SQLLDR_DIR
echo "Loading to DB ..."
(sqlldr userid=$DBUSER/$DBPASS@$DBSERVICETYPE control=$MAIN_GEOIP_DIR/bin/load_to_db.ctl data=ipdata.out log=load.log bad=load.bad discard=load.dsc) | tail -1
sleep 1
date '+Loader ended      : %Y.%m.%d %T'
echo "--------------------------------"
