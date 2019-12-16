#!/bin/sh
# Input file should be something like: GeoIPCityISPOrg-144.csv

if [ $# != 2 ]; then
  echo "usage: $0 SOURCE_DIR ORGANIZATION_CSV"
  exit 1
fi

SOURCE_DIR=$1
ORGANIZATION_CSV=$2

if [ ! -f $ORGANIZATION_CSV ]; then
  echo "Sorry but $ORGANIZATION_CSV does not exist"
  exit 1
fi

#COUNT='echo $ORGANIZATION_CSV | grep "GeoIPCityISPOrg-" | wc -l'
#
#case $COUNT in
#1) echo "OK" ;;
#*) 
#  echo "Sorry but $ORGANIZATION_CSV is not of the form: GeoIPCityISPOrg-nnnn.csv"
#  exit 1
#  ;;
#esac

ORGANIZATION_OUT=$SOURCE_DIR/organization.out

cat $ORGANIZATION_CSV | grep -v Copyright | grep -vi startIpNum \
| awk 'BEGIN {FS=OFS=""} {for (i=1;i<=NF;i++) {if ($i=="\"") {f=!f}; if (f && $i==",") $i=" "}}1' \
| sed -e 's/"//g' \
| sed -e 's/,/|/g' \
| sed -e 's/$/|/g' \
| sed -e 's/  / /g' \
| sed -e 's/||/|NULL|/g' \
| sed -e 's/||/|NULL|/g' \
| sed -e 's/||/|NULL|/g' > $ORGANIZATION_OUT

