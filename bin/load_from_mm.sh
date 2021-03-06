#!/bin/sh
date '+Starting                             : %Y.%m.%d %T'
MAIN_GEOIP_DIR=/u/debit/geo_ip
MAXMIND_DIR=$MAIN_GEOIP_DIR/maxmind
SOURCE_DIR=$MAIN_GEOIP_DIR/source
SQLLDR_DIR=$MAIN_GEOIP_DIR/oracle_loader

echo "Creating directories"
#date '+Creating directories                 : %Y.%m.%d %T'
mkdir -p $MAXMIND_DIR $SOURCE_DIR $SQLLDR_DIR

echo "Loading latest ZIP from MaxMind"
#previous license_key=uRw8mrYFzqoD
/usr/bin/wget -t 45 -O $MAXMIND_DIR/latest.GeoIP-144.gz -o $MAXMIND_DIR/maxmind_wget.log 'http://download.MaxMind.com/app/download_new?edition_id=144&suffix=zip&license_key=jbMjl0u3DO3F'
date '+Downloaded                           : %Y.%m.%d %T'

rm -rf $SOURCE_DIR/Geo* $SOURCE_DIR/loc*out $MAIN_GEOIP_DIR/org*out

echo "UnZip downloaded ZIP to $SOURCE_DIR"
unzip $MAXMIND_DIR/latest.GeoIP-144.gz -d $SOURCE_DIR/
date '+Unarchived                           : %Y.%m.%d %T'

LOCATION_CSV=`ls $SOURCE_DIR/GeoIP-144_*/GeoIPCity-144-Location.csv`
ORGANIZATION_CSV=`ls $SOURCE_DIR/GeoIP-144_*/GeoIPCityISPOrg-144.csv`

echo "Now doing: ./check_location.sh $SOURCE_DIR $LOCATION_CSV"
$MAIN_GEOIP_DIR/bin/check_location.sh $SOURCE_DIR $LOCATION_CSV
date '+Locations transformed                : %Y.%m.%d %T'

echo "Now doing: ./check_organization.sh $SOURCE_DIR $ORGANIZATION_CSV"
$MAIN_GEOIP_DIR/bin/check_organization.sh $SOURCE_DIR $ORGANIZATION_CSV
date '+Organizations transformed            : %Y.%m.%d %T'

echo "Now doing: ./merge_loc_and_org $SOURCE_DIR/location.out $SOURCE_DIR/organization.out $SQLLDR_DIR/ipdata.out"
$MAIN_GEOIP_DIR/bin/merge_loc_and_org $SOURCE_DIR/location.out $SOURCE_DIR/organization.out $SQLLDR_DIR/ipdata.out
date '+Merged locations with organizations  : %Y.%m.%d %T'

#rm -f $MAIN_GEOIP_DIR/organization.out

echo " "
echo "$SQLLDR_DIR/ipdata.out contains the data to be loaded into RETAIL DB"
echo " "

