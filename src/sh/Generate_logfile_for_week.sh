#!/bin/bash
#
# for i in {01..35} ; do  ./Generate_logfile_for_week.sh $i 2017 ; done
#

if [[ $1 == "" ]] ; then
    echo "Usage: Concatenate data for a week"
    echo "for i in {01..35} ; do  ./Generate_logfile_for_week.sh \$i 2017 ; done"
    exit 1
fi
if [[ $2 == "" ]] ; then
    echo "Usage: Concatenate data for a week, week number and year as input"
    exit 1
fi

weekName=week_$1_$2.log
dataCatalogue="../../data"
rm ${dataCatalogue}/$weekName
for i in `./weekOf.sh $1 $2 | tr ' ' '_'`
do
    cat ${dataCatalogue}/Conc_$i.log >> ${dataCatalogue}/$weekName
done

