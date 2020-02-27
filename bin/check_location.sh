#!/bin/sh
# Input file should be something like: GeoIPCity-144-Location.csv

if [ $# != 2 ]; then
  echo "usage: $0 SOURCE_DIR LOCATION_CSV"
  exit 1
fi

SOURCE_DIR=$1
LOCATION_CSV=$2

if [ ! -f $LOCATION_CSV ]; then
  echo "Sorry but $LOCATION_CSV does not exist"
  exit 1
fi

#COUNT='echo $LOCATION_CSV | grep GeoIPCity | grep Location | wc -l'
#
#case $COUNT in
#1) echo "OK" ;;
#*)
#  echo "Sorry but $LOCATION_CSV is not of the form:GeoIP-nnnn-Location.csv"
#  exit 1
#  ;;
#esac

LOCATION_OUT=$SOURCE_DIR/location.out

cat $LOCATION_CSV | grep -v Copyright | grep -vi postalCode \
| awk 'BEGIN {FS=OFS=""} {for (i=1;i<=NF;i++) {if ($i=="\"") {f=!f}; if (f && $i==",") $i=""}}1' \
| sed -e 's/"//g' \
| sed -e 's/,/|/g' \
| sed -e 's/$/|/g' \
| sed -e 's/||/|NULL|/g' \
| sed -e 's/||/|NULL|/g' \
| sed -e 's/||/|NULL|/g' > $LOCATION_OUT
