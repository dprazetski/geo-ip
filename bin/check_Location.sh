#!/bin/sh
ORIGIFS="$IFS"
IFS="|"


# ==================================================================
# Input file should be something like: GeoIPCity-144-Location.csv

if [ $# != 2 ]; then
        echo "usage: $0 dest_dir GeoIPCity-nnnn-Location.csv"
        exit 1
fi

DEST_DIR=$1
CSV_FILE=$2

if [ ! -f $CSV_FILE ]; then
        echo "Sorry but $CSV_FILE does not exist"
        exit 1
fi

#COUNT='echo $CSV_FILE | grep GeoIPCity | grep Location | wc -l'

#case $COUNT in
#1) echo "OK" ;;
#*)
#        echo "Sorry but $CSV_FILE is not of the form:GeoIP-nnnn-Location.csv"
#        exit 1
#    ;;
#esac

# =================================================================

LOCATION_OUT=$DEST_DIR/location.out
LOCATION_CHK=$DEST_DIR/location.chk
LOCATION_TMP=/tmp/location.$$.tmp
LOCATION_COMMA=/tmp/location.$$.comma

A_TMP=/tmp/A_$$.tmp
B_TMP=/tmp/B_$$.tmp

# over the years numerous issues have been found requiring a boatload of filtering like below.  This may not be needed anymore,
# but never had time or need to revisit

cat $CSV_FILE | grep -v Copyright | grep -vi postalCode \
| sed -e 's/|"/"/g' \
| sed -e 's/|/\//g' \
| sed -e 's/","/|/g' \
| sed -e 's/,,$/|NULL|NULL|/g' \
| sed -e 's/"",/NULL|/g' > ${A_TMP}

cat ${A_TMP} | sed -e 's/",/|/g' \
| sed -e 's/9,"/9|/g' \
| sed -e 's/8,"/8|/g' \
| sed -e 's/7,"/7|/g' \
| sed -e 's/6,"/6|/g' > ${B_TMP}

cat ${B_TMP} | sed -e 's/5,"/5|/g' \
| sed -e 's/4,"/4|/g' \
| sed -e 's/3,"/3|/g' \
| sed -e 's/2,"/2|/g' \
| sed -e 's/1,"/1|/g' > ${A_TMP}

cat ${A_TMP} | sed -e 's/0,"/0|/g' \
| sed -e 's/0,0/0|0/g' \
| sed -e 's/0,0/0|0/g' \
| sed -e 's/0,1/0|1/g' \
| sed -e 's/0,2/0|2/g' > ${B_TMP}

cat ${B_TMP} | sed -e 's/0,3/0|3/g' \
| sed -e 's/0,4/0|4/g' \
| sed -e 's/0,5/0|5/g' \
| sed -e 's/0,6/0|6/g' \
| sed -e 's/0,7/0|7/g' > ${A_TMP}

cat ${A_TMP} | sed -e 's/0,8/0|8/g' \
| sed -e 's/0,9/0|9/g' \
| sed -e 's/1,0/1|0/g' \
| sed -e 's/1,1/1|1/g' \
| sed -e 's/1,2/1|2/g' > ${B_TMP}

cat ${B_TMP} | sed -e 's/1,3/1|3/g' \
| sed -e 's/1,4/1|4/g' \
| sed -e 's/1,5/1|5/g' \
| sed -e 's/1,6/1|6/g' \
| sed -e 's/1,7/1|7/g' > ${A_TMP}

cat ${A_TMP} | sed -e 's/1,8/1|8/g' \
| sed -e 's/1,9/1|9/g' \
| sed -e 's/2,0/2|0/g' \
| sed -e 's/2,1/2|1/g' \
| sed -e 's/2,2/2|2/g' > ${B_TMP}

cat ${B_TMP} | sed -e 's/2,3/2|3/g' \
| sed -e 's/2,4/2|4/g' \
| sed -e 's/2,5/2|5/g' \
| sed -e 's/2,6/2|6/g' \
| sed -e 's/2,7/2|7/g' > ${A_TMP}

cat ${A_TMP} | sed -e 's/2,8/2|8/g' \
| sed -e 's/2,9/2|9/g' \
| sed -e 's/3,0/3|0/g' \
| sed -e 's/3,1/3|1/g' \
| sed -e 's/3,2/3|2/g' > ${B_TMP}

cat ${B_TMP} | sed -e 's/3,3/3|3/g' \
| sed -e 's/3,4/3|4/g' \
| sed -e 's/3,5/3|5/g' \
| sed -e 's/3,6/3|6/g' \
| sed -e 's/3,7/3|7/g' > ${A_TMP}

cat ${A_TMP} | sed -e 's/3,8/3|8/g' \
| sed -e 's/3,9/3|9/g' \
| sed -e 's/4,0/4|0/g' \
| sed -e 's/4,1/4|1/g' \
| sed -e 's/4,2/4|2/g' > ${B_TMP}

cat ${B_TMP} | sed -e 's/4,3/4|3/g' \
| sed -e 's/4,4/4|4/g' \
| sed -e 's/4,5/4|5/g' \
| sed -e 's/4,6/4|6/g' \
| sed -e 's/4,7/4|7/g' > ${A_TMP}

cat ${A_TMP} | sed -e 's/4,8/4|8/g' \
| sed -e 's/4,9/4|9/g' \
| sed -e 's/5,0/5|0/g' \
| sed -e 's/5,1/5|1/g' \
| sed -e 's/5,2/5|2/g' > ${B_TMP}

cat ${B_TMP} | sed -e 's/5,3/5|3/g' \
| sed -e 's/5,4/5|4/g' \
| sed -e 's/5,5/5|5/g' \
| sed -e 's/5,6/5|6/g' \
| sed -e 's/5,7/5|7/g' > ${A_TMP}

cat ${A_TMP} | sed -e 's/5,8/5|8/g' \
| sed -e 's/5,9/5|9/g' \
| sed -e 's/6,0/6|0/g' \
| sed -e 's/6,1/6|1/g' \
| sed -e 's/6,2/6|2/g' > ${B_TMP}

cat ${B_TMP} | sed -e 's/6,3/6|3/g' \
| sed -e 's/6,4/6|4/g' \
| sed -e 's/6,5/6|5/g' \
| sed -e 's/6,6/6|6/g' \
| sed -e 's/6,7/6|7/g' > ${A_TMP}

cat ${A_TMP} | sed -e 's/6,8/6|8/g' \
| sed -e 's/6,9/6|9/g' \
| sed -e 's/7,0/7|0/g' \
| sed -e 's/7,1/7|1/g' \
| sed -e 's/7,2/7|2/g' > ${B_TMP}

cat ${B_TMP} | sed -e 's/7,3/7|3/g' \
| sed -e 's/7,4/7|4/g' \
| sed -e 's/7,5/7|5/g' \
| sed -e 's/7,6/7|6/g' \
| sed -e 's/7,7/7|7/g' > ${A_TMP}

cat ${A_TMP} | sed -e 's/7,8/7|8/g' \
| sed -e 's/7,9/7|9/g' \
| sed -e 's/8,0/8|0/g' \
| sed -e 's/8,1/8|1/g' \
| sed -e 's/8,2/8|2/g' > ${B_TMP}

cat ${B_TMP} | sed -e 's/8,3/8|3/g' \
| sed -e 's/8,4/8|4/g' \
| sed -e 's/8,5/8|5/g' \
| sed -e 's/8,6/8|6/g' \
| sed -e 's/8,7/8|7/g' > ${A_TMP}

cat ${A_TMP} | sed -e 's/8,8/8|8/g' \
| sed -e 's/8,9/8|9/g' \
| sed -e 's/9,0/9|0/g' \
| sed -e 's/9,1/9|1/g' \
| sed -e 's/9,2/9|2/g' > ${B_TMP}

cat ${B_TMP} | sed -e 's/9,3/9|3/g' \
| sed -e 's/9,4/9|4/g' \
| sed -e 's/9,5/9|5/g' \
| sed -e 's/9,6/9|6/g' \
| sed -e 's/9,7/9|7/g' > ${A_TMP}

cat ${A_TMP} | sed -e 's/9,8/9|8/g' \
| sed -e 's/9,9/9|9/g' \
| sed -e 's/0,"/0|/g' \
| sed -e 's/1,"/1|/g' \
| sed -e 's/2,"/2|/g' > ${B_TMP}

cat ${B_TMP} | sed -e 's/3,"/3|/g' \
| sed -e 's/4,"/4|/g' \
| sed -e 's/5,"/5|/g' \
| sed -e 's/6,"/6|/g' \
| sed -e 's/7,"/7|/g' > ${A_TMP}

cat ${A_TMP} | sed -e 's/8,"/8|/g' \
| sed -e 's/9,"/9|/g' \
| sed -e 's/",/|/g' \
| sed -e 's/,-/|-/g' \
| sed -e 's/"$/|/g' > ${B_TMP}

cat ${B_TMP} | sed -e 's/"/|/g' \
| sed -e 's/,$/|NULL|/g' \
| sed -e 's/,,/|NULL|NULL|/g' \
| sed -e 's/||/|NULL|/g' \
| sed -e 's/||/|NULL|/g' > ${A_TMP}

cat ${A_TMP} | sed -e 's/||/|NULL|/g' \
| sed -e 's/||/|NULL|/g' \
| sed -e 's/||/|NULL|/g' \
| sed -e 's/||/|NULL|/g' > ${B_TMP}

cat ${B_TMP} | sed -e 's/||/|NULL|/g' \
| sed -e 's/^"//g' > $LOCATION_OUT
rm -f ${A_TMP}
rm -f ${B_TMP}
grep "|$" $LOCATION_OUT > $LOCATION_TMP
grep -v "|$" $LOCATION_OUT | sed -e 's/$/|/g' >> $LOCATION_TMP

# Known locations containing commas.   Commas
# 420399|US|DC|Washington, D. C.|NULL|38.8951|-77.0364|NULL|NULL|
# 825556|NZ|00|Oamaru, Waitaki District|9444|-45.0975|170.9691|NULL|NULL|
# 896145|CH|00|Thayngen, Barzheim|8241|47.7605|8.7213|NULL|NULL|
# 1056657|US|NY|Elmira,|14905|42.0869|-76.8397|565|607|
# 1056853|US|KY|Lexington,|40502|38.0174|-84.4854|541|859|
# 1056864|US|IN|Indianapolis,|46204|39.7720|-86.1535|527|317|
# 1056909|US|OH|Warrensville Heights,|44128|41.4416|-81.5486|510|216|
# 1056972|US|NY|85 10th Avenue, New York|10011|40.7308|-73.9975|501|212|
# 1057065|US|NY|New York,|10017|40.7517|-73.9707|501|212|
# 1057085|US|CA|Los Angeles, Ca|90014|34.0494|-118.2641|803|213|
# 1057089|US|MI|Mount Pleasant, Mi|48858|43.6013|-84.7736|513|989|
# 1057118|US|GA|Atlanta,|30313|33.7683|-84.3935|524|404|
# 1057152|US|TX|Dallas, Tx 75247-3509|01515|42.2193|-72.0481|506|508|
# 1057185|US|NY|Sloan, Ny|14212|42.8946|-78.8245|514|716|
# 1057188|US|CA|Los Angeles,|90014|34.0494|-118.2641|803|213|
# 1057265|US|SC|Greenville,|29304|34.9166|-81.8639|567|864|
# 1057278|US|CA|California, El Segundo|90245|33.9243|-118.4119|803|310|
# 1057293|US|TX|Dallas,|75228|32.8250|-96.6784|623|214|
# 1057327|US|GA|Statesboro,|30458|32.4408|-81.7740|507|912|
# 1061415|CR|03|Coco, Sardinal|50503|10.5430|-85.6982|NULL|NULL|
# 1066193|JP|04|Kashiwa|2770813,|35.9046|139.9632|NULL|NULL|
# 1068542|US|MD|Annapolis, Md|21140|38.9504|-76.5854|512|410|
# 1104598|HN|16|Las Vegas, Santa Barbara|NULL|14.8765|-88.0747|NULL|NULL|
# 1165575|US|IN|South Bend, In|46619|41.6674|-86.3153|588|574|
# 1171137|US|NY|Rye Brook, Ny|10573|41.0213|-73.6781|501|914|
# 1171138|US|MO|St. Charles, Mo|63303|38.7630|-90.5474|609|636|
# 1171161|US|FL|Palm Beach County, Fl|33401|26.7165|-80.0679|548|561|

sort -n $LOCATION_TMP > $LOCATION_OUT
cat $LOCATION_OUT | grep -v "Washington, D. C." | grep -v "Oamaru, Waitaki District" | grep -v "Thayngen, Barzheim" | grep -v "Elmira," | grep -v "Lexington," | grep -v "Indianapolis," | grep -v "Warrensville Heights," | grep -v "85 10th Avenue, New York" | grep -v "New York," | grep -v "Los Angeles, Ca" | grep -v "Mount Pleasant, Mi" | grep -v "Atlanta," | grep -v "Dallas, Tx 75247-3509" | grep -v "Sloan, Ny" | grep -v "Los Angeles," | grep -v "Greenville," | grep -v "California, El Segundo" | grep -v "Dallas," | grep -v "Statesboro," | grep -v "Coco, Sardinal" | grep -v "Kashiwa" | grep -v "Annapolis, Md"  | grep -v "Washington, D.c" | grep -v "Rosario, El" | grep -v "Las Vegas, Santa Barbara" | grep -v "South Bend, In" | grep -v "Rye Brook, Ny" | grep -v "St. Charles, Mo" | grep -v "Palm Beach County, Fl" > $LOCATION_CHK

rm -f $LOCATION_TMP

grep "," $LOCATION_CHK > $LOCATION_COMMA
if [ -s $LOCATION_COMMA ]; then
  echo " "
  echo " "
  echo "Possible issue.   Found some commas in the data. ..."
  echo " "
  cat $LOCATION_COMMA
  echo " "
  echo "If something appears above there might be an issue with the data.  CTRL-C to exit if needed."
  echo " "
  echo "HIT RETURN TO CONTINUE"
  echo " "
  read ans1
  rm -f $LOCATION_COMMA
else
  echo " "
  echo "Data coming out of step1 looks good"
  echo " "
fi

rm -f $LOCATION_CHK
