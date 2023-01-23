#! bin/bash

LOGFILE="../Logfiles/SSLogFileScale200Batch-6.log"
ROWCOUNTQUERY="../Queries/RecordCountMemSQL.sql"

echo -e "Table Record Count:\n" >> $LOGFILE
mysql -u svc_user -h svc-fdb55051-1f3e-45f4-ae2d-20b191b3dd92-dml.azr-virginia1-1.svc.singlestore.com -P 3306 --default-auth=mysql_native_password -padmin123 -t < "$ROWCOUNTQUERY" >> $LOGFILE

echo -e "\n" >> $LOGFILE

for count in {1..99};
do         
    mysql -u svc_user -h svc-fdb55051-1f3e-45f4-ae2d-20b191b3dd92-dml.azr-virginia1-1.svc.singlestore.com -P 3306 --default-auth=mysql_native_password -padmin123 -e "DROP ALL FROM PLANCACHE;" 
    echo "Plancache has been cleared..."

    FILE="../Queries/query"$count".sql"
    
    echo -e "${FILE:36}\n" >> $LOGFILE
    
    cp $FILE temp.sql

    echo -e "\nSHOW PROFILE JSON;" >> temp.sql

    outputnew=`mysql -u svc_user -h svc-fdb55051-1f3e-45f4-ae2d-20b191b3dd92-dml.azr-virginia1-1.svc.singlestore.com -P 3306 --default-auth=mysql_native_password -padmin123 -t < temp.sql`
    temp1=`echo $outputnew | sed 's/.*total_runtime_ms":\(.*\)"text_profile":/\1/'`

    temp1=${temp1:1:35}
    temp2=${temp1%'",'*}
    
    if [ -z "$temp2" ]
    then
        temp2="0"
    fi

    echo ${FILE:36}" Execution Time: "${temp2} "ms"
    
    cat $FILE >> $LOGFILE

    echo -e "\n" >> $LOGFILE

    output=$( mysql -u svc_user -h svc-fdb55051-1f3e-45f4-ae2d-20b191b3dd92-dml.azr-virginia1-1.svc.singlestore.com -P 3306 --default-auth=mysql_native_password -padmin123 --table < $FILE 2>&1 )

    if [[ "$output" == *"ERROR"* ]];
    then
        temp=${output#*"ERROR"}
        echo -e "ERROR" $temp"\n" >> $LOGFILE
    elif [[ "$output" == *"cnt"* || "$output" == *"count"* ]];
    then
        echo -e "${output:81}\n" >> $LOGFILE
    elif [[ "$output" != *"+-----------"* ]];
    then
        echo -e "0 Record(s) returned.\n" >> $LOGFILE
    else
        echo -e "${output:81}\n" >> $LOGFILE
    fi

    echo -e ${FILE:36}" Execution Time: "${temp2} "ms\n" >> $LOGFILE

done