#!/bin/bash
week=$1 year=$2
date_fmt="+%Y %m %d"
# %V   ISO week number, with Monday as first day of week (01..53)
# %W   week number of year, with Monday as first day of week (00..53)
week_num_of_Mon_1=$(date -d ${year}-01-01 +%W)
# %u   day of week (1..7); 1 is Monday
week_day_of_Mon_1=$(date -d ${year}-01-01 +%u)

if ((week_num_of_Mon_1)); then
   first_Mon=${year}-01-01
else
   first_Mon=${year}-01-$((01 + (7 - week_day_of_Mon_1 + 1) ))
fi

# remove leading zero in week
nozero=$(echo $week | sed 's/^0*//')

for nr_of_day_of_week in 0 1 2 3 4 5 6
do
    day_of_week=$(date -d "$first_Mon $((nozero - 1)) week $nr_of_day_of_week day" "$date_fmt")
    echo ${day_of_week}
done
