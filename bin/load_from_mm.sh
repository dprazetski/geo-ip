#!/bin/sh

main_GeoIP_DIR=/u/debit/geo_ip
MaxMind_DIR=$main_GeoIP_DIR/MaxMind
Source_DIR=$main_GeoIP_DIR/Source
SqlLdr_DIR=$main_GeoIP_DIR/Oracle_Loader

echo "Creating directories"
mkdir -p $MaxMind_DIR $Source_DIR $SqlLdr_DIR

echo "Loading latest ZIP from MaxMind"
#previous license_key=uRw8mrYFzqoD
/usr/bin/wget -t 45 -O $MaxMind_DIR/latest.GeoIP-144.gz -o $MaxMind_DIR/MaxMind_wget.log 'http://download.MaxMind.com/app/download_new?edition_id=144&suffix=zip&license_key=jbMjl0u3DO3F'

#cd $SqlLdr_DIR
rm -rfi $Source_DIR/G* $Source_DIR/loc*
#cd ../

#mv $MaxMind_DIR/latest.GeoIP-144.gz $Source_DIR/GeoIP-144.gz
echo "UnZip downloaded ZIP to $Source_DIR"
#cd $Source_DIR
unzip $MaxMind_DIR/latest.GeoIP-144.gz -d $Source_DIR/
#cd ../

LOCATION_CSV=`ls $Source_DIR/GeoIP-144_*/GeoIPCity-144-Location.csv`
ISPOrg_CSV=`ls $Source_DIR/GeoIP-144_*/GeoIPCityISPOrg-144.csv`

echo "Now doing: ./check_Location.sh $Source_DIR $LOCATION_CSV"
$main_GeoIP_DIR/bin/check_Location.sh $Source_DIR $LOCATION_CSV

echo "Now doing: ./check_ISPOrg.sh $main_GeoIP_DIR $ISPOrg_CSV"
$main_GeoIP_DIR/bin/check_ISPOrg.sh $main_GeoIP_DIR $ISPOrg_CSV

echo "Now doing: ./get_locs $Source_DIR/location.out $main_GeoIP_DIR/tmp_ipdata.out $SqlLdr_DIR/ipdata.out"
$main_GeoIP_DIR/bin/get_locs $Source_DIR/location.out $main_GeoIP_DIR/tmp_ipdata.out $SqlLdr_DIR/ipdata.out

rm -f $main_GeoIP_DIR/tmp_ipdata.out

#mv $main_GeoIP_DIR/ipdata.out $SqlLdr_DIR

echo " "
echo "$SqlLdr_DIR/ipdata.out contains the data to be loaded into RETAIL DB"
echo " "
