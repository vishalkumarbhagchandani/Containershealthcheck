#! /bin/bash

echo "This snippet will run and push the docker metrics to the CSV and check postgresql status"
echo "please enter how many seconds to run"

secondsToRun=$1

echo "will run for $secondsToRun seconds from" $date > formattingDoc1.tmp

while [ $SECONDS -lt $secondsToRun ]
do

        systemctl show -p ActiveState postgresql-11 | sed 's/ActiveState=//g' >> postgresqlstatus.csv
        $(date) >> postgresqlstatus.csv
        docker stats --format="{{.ID}},{{.Name}},{{.CPUPerc}}{{.MemUsage}}" --no-stream >> formattingDoc2.tmp
done

#sed 's/%//g' dockerstats.csv > formattingDoc2.tmp

exit 0;

