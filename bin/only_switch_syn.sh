#!/bin/sh
date '+Starting                             : %Y.%m.%d %T'
########################################
####### Variables Initialization #######
MAIN_GEOIP_DIR=/u/debit/geo_ip
SQLLDR_DIR=$MAIN_GEOIP_DIR/oracle_loader
########################################
########### DB Configuration ###########
DBUSER=geoip
DBPASS=geoip
DBSERVICETYPE=RETAIL
########################################
######### Swithching Synonyms  #########
cd $SQLLDR_DIR
echo "Switching Synonyms ..."
(sqlplus -s $DBUSER/$DBPASS@$DBSERVICETYPE @$MAIN_GEOIP_DIR/bin/switch_synonyms.sql)
date '+Switched                             : %Y.%m.%d %T'
echo "--------------------------------"

