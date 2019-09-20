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

