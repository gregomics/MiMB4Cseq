#!/usr/bin/bash


while getopts p:o:r:f:h flag
do
    case "${flag}" in
        p) paired2=${OPTARG};;
        o) paired1=${OPTARG};;
        f) R1=${OPTARG};;
        r) R2=${OPTARG};;
        h|*) echo "Usage: $0  
                            -f R1 file 
                            -r R2 file
                            -o filtered R1 file
                            -p filtered R2 file
                            -h shows this help"; exit 2;;
    esac
done

if [ -e $R1 ] && [ -e $R2 ]; then
   echo "ok found: $R1 and $R2"
   # extracting read IDS:
   R1ids=$R1\.ids
   awk 'NR%4==1{print $1, $5}' $R1 > $R1ids
   R2ids=$R2\.ids
   awk 'NR%4==1{print $1, $5}' $R2 > $R2ids
   # taking common read IDs but need to sort it first
   commonIDs=$R1\.com
   comm -12 <( sort $R1ids ) <( sort $R2ids) > $commonIDs
   # extracting paired from R1 and R2
   grep -f $commonIDs --no-group-separator -A 3 $R1 > $paired1
   grep -f $commonIDs --no-group-separator -A 3 $R2 > $paired2
   # cleaning tmp files:
   rm $R1ids $R2ids $commonIDs
   exit 0
else
   echo die: missing either: $R1 or $R2
   exit 2
