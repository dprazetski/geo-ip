#!/bin/sh

MAIN_GEOIP_DIR=/u/debit/geo_ip
MAXMIND_DIR=$MAIN_GEOIP_DIR/maxmind
SOURCE_DIR=$MAIN_GEOIP_DIR/source
SQLLDR_DIR=$MAIN_GEOIP_DIR/oracle_loader

echo "Creating directories"
mkdir -p $MAXMIND_DIR $SOURCE_DIR $SQLLDR_DIR

echo "Loading latest ZIP from MaxMind"
#previous license_key=uRw8mrYFzqoD
/usr/bin/wget -t 45 -O $MAXMIND_DIR/latest.GeoIP-144.gz -o $MAXMIND_DIR/maxmind_wget.log 'http://download.MaxMind.com/app/download_new?edition_id=144&suffix=zip&license_key=jbMjl0u3DO3F'

