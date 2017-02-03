#!/bin/bash


today_suffix=$year$month$day

HIVE="/var/bh/hive/bin/hive --hiveconf mapreduce.job.queuename=zampda_job"


#cleaning

#year=`date -d "-1 day" +%Y`
#month=`date -d "-1 day" +%m`
#day=`date -d "-1 day" +%d`
#hour=`date -d "-1 day" +%H`

year=`date -d "-1 hour" +%Y`
month=`date -d "-1 hour" +%m`
day=`date -d "-1 hour" +%d`
hour=`date -d "-1 hour" +%H`

echo $year-$month-$day-$hour

#day=23
#$HIVE -e "select distinct mobile_id from etl_output.uc_segments where year=$year and month=$month and day=$day and args like \"%actname%\" and mobile_id like \"%68=%\";">ucidfahash
#awk -F'=' '{print $2}' ucidfahash>ucidfahash.single
year=2016
month=7
day=27
$HIVE -e "select vendor_id, ad_response[0].total_error_code,count(1) from archive.rtbv2 where year=$year and month=$month and day=$day group by vendor_id,ad_response[0].total_error_code;">errdis$month$day
$HIVE -e "select vendor_id, count(1) from etl_output.dimpv2 where year=$year and month=$month and day=$day group by vendor_id;">imp$month$day


#for line in `cat ./idfas`
#do
  #echo "http://ut.gtags.net/imp/yd?a=9&idfa="$line"&ext_args=sdk%3d1"
  #curl "http://ut.gtags.net/imp/yd?a=9&idfa="$line"&ext_args=sdk%3d1"
#done




#year=`date -d "yesterday" +%Y`
#month=`date -d "yesterday" +%m`
#day=`date -d "yesterday" +%d`

#today_suffix=$year$month$day

#$HIVE -e "select distinct id1.id,vendor_id from etl_output.rtbv2 lateral view explode(additional_ids) ids_table1 as id1 where year=$year and month=$month and day=$day  and id1.type=61 and vendor_id in (5,15,16,21,24);">rtbidfa
#$HIVE -e "select distinct id1.id,vendor_id from etl_output.rtbv2_bys lateral view explode(additional_ids) ids_table1 as id1 where year=$year and month=$month and day=$day  and id1.type=61 and vendor_id in (5,15,16,21,24);">rtbidfa.bys

#cat rtbidfa*>rtbidfa.all

#python cross.py>result.$today_suffix



