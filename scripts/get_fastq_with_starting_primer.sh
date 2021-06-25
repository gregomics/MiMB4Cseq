#!/usr/bin/bash


while getopts p:o:i:fh flag
do
    case "${flag}" in
        p) primer=${OPTARG};;
        o) outFile=${OPTARG};;
        i) fastq=${OPTARG};;
        f) force=${OPTARG};;
        h|*) echo "Usage: $0  
                            -p primer 
                            -o output file under fastq format
                            -i input fastq
                            -f force overwrite output
                            -h shows this help"; exit 2;;
    esac
done

echo parsing $fastq to search for starting: $primer


if [ -e $fastq ]; then
   echo "ok found: $fastq"
else
   echo die: missing fastq file: $fastq
   exit 2
fi

if [ ! -e $outFile ] ; then
   echo creating: $outFile
   grep -i "^$primer" -A 2 -B 1 $fastq > $outFile
   exit 0;
fi
if [ -e $outFile ] && [ ! -z ${force+x} ]; then
   echo $outFile will be overwritten
   grep -i "^$primer" -A 2 -B 1 $fastq > $outFile
   exit 0;
else
   echo "output : $outFile already there! used the force (-f) to overwrite it!"
   exit 2
fi
