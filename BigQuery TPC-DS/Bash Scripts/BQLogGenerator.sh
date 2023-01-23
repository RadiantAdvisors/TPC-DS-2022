#! /bin/bash

SCALE=200

LOGFILE="../Logfiles/BQLogFileScale${SCALE}FlexSlotBatch-5.log"
ROWCOUNTQUERY="../Queries/BQRecordCountBQ.sql"

echo -e "Table Record Count:\n" >> $LOGFILE
bq query --project_id=infra-agent-370017  --use_legacy_sql=false --nouse_cache < "$ROWCOUNTQUERY" >> $LOGFILE

echo -e "\n" >> $LOGFILE

for count in {1..99};
do
  # 95th query is null in BigQuery
  if [[ $count == 95 ]]
  then 
	continue
  fi

  FILE="../Queries/query${count}.sql"
  echo -e "${FILE:50}\n" >> $LOGFILE

  cat $FILE >> $LOGFILE
  echo -e "\n" >> $LOGFILE

  output=`bq query --project_id=infra-agent-370017  --use_legacy_sql=false --nouse_cache < "$FILE"`

  if [ -z "$output" ]
  then
	echo -e "0 Record(s) returned.\n" >> $LOGFILE
  else
	echo "$output" >> $LOGFILE
  fi

  state=$(bq ls -j -n 1 | awk '{if(NR>2)print}' | awk '{print $3}')
  duration=$(bq ls -j -n 1 | awk '{if(NR>2)print}' | awk '{print $7}')

  echo "Executed Query${count}.sql State: ${state} Duration: ${duration}"

  job_id=$(bq ls -j -n 1 | awk '{if(NR>2)print}' | awk '{print $1}')

  query_info="SELECT job_id,
  		     '$state' as state,
  	 	     reservation_id,
  		     job_type,
  		     total_slot_ms/1000 as slot_sec,
                     cache_hit,
  		     start_time,
  	             TIMESTAMP_DIFF(end_time,start_time,MILLISECOND)/1000 as elapsed_time
  	      FROM  \`region-us\`.INFORMATION_SCHEMA.JOBS_BY_PROJECT
  	      WHERE job_id='$job_id';"
  echo -e "\n" >> $LOGFILE
  
  bq query --project_id=infra-agent-370017 --use_legacy_sql=false $query_info >> $LOGFILE
  echo -e "\n" >> $LOGFILE

done
