#!/bin/sh
ORIGIFS="$IFS"
IFS="|"
# ===========================================================================================
# Input file should be something like: GeoIPCityISPOrg-144.csv

if [ $# != 2 ]; then
        echo "usage: $0 dest_dir GeoIPCityISPOrg-nnnn.csv"
        exit 1
fi

DEST_DIR=$1
CSV_FILE=$2
if [ ! -f $CSV_FILE ]; then
        echo "Sorry but $CSV_FILE does not exist"
        exit 1
fi

#COUNT='echo $CSV_FILE | grep "GeoIPCityISPOrg-" | wc -l'
#
#case $COUNT in
#1) echo "OK" ;;
#*)
#        echo "Sorry but $CSV_FILE is not of the form: GeoIPCityISPOrg-nnnn.csv"
#        exit 1
#   ;;
#esac

# ===================================================================
TMP_IP_DATA=$DEST_DIR/tmp_ipdata.out
IP_DATA=$DEST_DIR/ipdata.out
A_TMP=$DEST_DIR/A_$$.tmp
B_TMP=$DEST_DIR/B_$$.tmp
#date > STEP_2_START
cat $CSV_FILE | grep -v Copyright | grep -vi startIpNum \
| sed -e 's/|"/"/g' \
| sed -e 's/|/\//g' \
| sed -e 's/^/"/g' \
| sed -e 's/0,0/0","0/g' \
| sed -e 's/0,1/0","1/g' > ${A_TMP}

cat ${A_TMP} | sed -e 's/0,2/0","2/g' \
| sed -e 's/0,3/0","3/g' \
| sed -e 's/0,4/0","4/g' \
| sed -e 's/0,5/0","5/g' \
| sed -e 's/0,6/0","6/g' \
| sed -e 's/0,7/0","7/g' > ${B_TMP}

cat ${B_TMP} | sed -e 's/0,8/0","8/g' \
| sed -e 's/0,9/0","9/g' \
| sed -e 's/1,0/1","0/g' \
| sed -e 's/1,1/1","1/g' \
| sed -e 's/1,2/1","2/g' \
| sed -e 's/1,3/1","3/g' > ${A_TMP}

cat ${A_TMP} | sed -e 's/1,4/1","4/g' \
| sed -e 's/1,5/1","5/g' \
| sed -e 's/1,6/1","6/g' \
| sed -e 's/1,7/1","7/g' \
| sed -e 's/1,8/1","8/g' > ${B_TMP}

cat ${B_TMP} | sed -e 's/1,9/1","9/g' \
| sed -e 's/2,0/2","0/g' \
| sed -e 's/2,1/2","1/g' \
| sed -e 's/2,2/2","2/g' \
| sed -e 's/2,3/2","3/g' > ${A_TMP}

cat ${A_TMP} | sed -e 's/2,4/2","4/g' \
| sed -e 's/2,5/2","5/g' \
| sed -e 's/2,6/2","6/g' \
| sed -e 's/2,7/2","7/g' \
| sed -e 's/2,8/2","8/g' > ${B_TMP}

cat ${B_TMP} | sed -e 's/2,9/2","9/g' \
| sed -e 's/3,0/3","0/g' \
| sed -e 's/3,1/3","1/g' \
| sed -e 's/3,2/3","2/g' \
| sed -e 's/3,3/3","3/g' > ${A_TMP}

cat ${A_TMP} | sed -e 's/3,4/3","4/g' \
| sed -e 's/3,5/3","5/g' \
| sed -e 's/3,6/3","6/g' \
| sed -e 's/3,7/3","7/g' \
| sed -e 's/3,8/3","8/g' > ${B_TMP}

cat ${B_TMP} | sed -e 's/3,9/3","9/g' \
| sed -e 's/4,0/4","0/g' \
| sed -e 's/4,1/4","1/g' \
| sed -e 's/4,2/4","2/g' \
| sed -e 's/4,3/4","3/g' > ${A_TMP}

cat ${A_TMP} | sed -e 's/4,4/4","4/g' \
| sed -e 's/4,5/4","5/g' \
| sed -e 's/4,6/4","6/g' \
| sed -e 's/4,7/4","7/g' \
| sed -e 's/4,8/4","8/g' > ${B_TMP}

cat ${B_TMP} | sed -e 's/4,9/4","9/g' \
| sed -e 's/5,0/5","0/g' \
| sed -e 's/5,1/5","1/g' \
| sed -e 's/5,2/5","2/g' \
| sed -e 's/5,3/5","3/g' > ${A_TMP}

cat ${A_TMP} | sed -e 's/5,4/5","4/g' \
| sed -e 's/5,5/5","5/g' \
| sed -e 's/5,6/5","6/g' \
| sed -e 's/5,7/5","7/g' \
| sed -e 's/5,8/5","8/g' > ${B_TMP}

cat ${B_TMP} | sed -e 's/5,9/5","9/g' \
| sed -e 's/6,0/6","0/g' \
| sed -e 's/6,1/6","1/g' \
| sed -e 's/6,2/6","2/g' \
| sed -e 's/6,3/6","3/g' > ${A_TMP}

cat ${A_TMP} | sed -e 's/6,4/6","4/g' \
| sed -e 's/6,5/6","5/g' \
| sed -e 's/6,6/6","6/g' \
| sed -e 's/6,7/6","7/g' \
| sed -e 's/6,8/6","8/g' > ${B_TMP}

cat ${B_TMP} | sed -e 's/6,9/6","9/g' \
| sed -e 's/7,0/7","0/g' \
| sed -e 's/7,1/7","1/g' \
| sed -e 's/7,2/7","2/g' \
| sed -e 's/7,3/7","3/g' > ${A_TMP}

cat ${A_TMP} | sed -e 's/7,4/7","4/g' \
| sed -e 's/7,5/7","5/g' \
| sed -e 's/7,6/7","6/g' \
| sed -e 's/7,7/7","7/g' \
| sed -e 's/7,8/7","8/g' > ${B_TMP}

cat ${B_TMP} | sed -e 's/7,9/7","9/g' \
| sed -e 's/8,0/8","0/g' \
| sed -e 's/8,1/8","1/g' \
| sed -e 's/8,2/8","2/g' \
| sed -e 's/8,3/8","3/g' > ${A_TMP}

cat ${A_TMP} | sed -e 's/8,4/8","4/g' \
| sed -e 's/8,5/8","5/g' \
| sed -e 's/8,6/8","6/g' \
| sed -e 's/8,7/8","7/g' \
| sed -e 's/8,8/8","8/g' > ${B_TMP}

cat ${B_TMP} | sed -e 's/8,9/8","9/g' \
| sed -e 's/9,0/9","0/g' \
| sed -e 's/9,1/9","1/g' \
| sed -e 's/9,2/9","2/g' \
| sed -e 's/9,3/9","3/g' > ${A_TMP}

cat ${A_TMP} | sed -e 's/9,4/9","4/g' \
| sed -e 's/9,5/9","5/g' \
| sed -e 's/9,6/9","6/g' \
| sed -e 's/9,7/9","7/g' \
| sed -e 's/9,8/9","8/g' > ${B_TMP}

cat ${B_TMP} | sed -e 's/9,9/9","9/g' \
| sed -e 's/0,"/0","/g' \
| sed -e 's/1,"/1","/g' \
| sed -e 's/2,"/2","/g' \
| sed -e 's/3,"/3","/g' > ${A_TMP}

cat ${A_TMP} | sed -e 's/4,"/4","/g' \
| sed -e 's/5,"/5","/g' \
| sed -e 's/6,"/6","/g' \
| sed -e 's/7,"/7","/g' \
| sed -e 's/8,"/8","/g' > ${B_TMP}

cat ${B_TMP} | sed -e 's/9,"/9","/g' \
| sed -e "s/\",\"/|/g" \
| sed -e "s/\"$/|/g" \
| sed -e "s/^\"//g"  \
| sed -e 's/||/|NULL|/g'  > ${A_TMP}

cat ${A_TMP} | sed -e 's/||/|NULL|/g'  \
| sed -e 's/||/|NULL|/g'  \
| sed -e 's/||/|NULL|/g'  \
| sed -e 's/||/|NULL|/g'  \
| sed -e 's/||/|NULL|/g'  \
| sed -e 's/||/|NULL|/g' > $TMP_IP_DATA

rm -f ${A_TMP}
rm -f ${B_TMP}

#date > STEP_2_END
