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
$HIVE -e "select distinct(idfa) from etl_output.appboot where year=$year and month=$month and day=$day and hour=$hour and app_key='F8EFCB6EFD5DFC35E8FEE5B59A7CFD65_9';">idfas

python send_idfas.py
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



