#!/bin/bash 

Echo “Will create db if it doesn’t exist”

sqlite3 -h localhost -p 1433 metrics.db <<EOF create table dockermetrics IF NOT EXISTS (loggingtime TEXT, containerId TEXT, containerName TEXT, CPUPerc TEXT, memusage TEXT)

sqlite3 metrics.db ".mode csv" ".import dockerStats.csv dockermetrics" ".exit"

sqlite3 -h localhost -p 1433 metrics.db <<EOF create table postgresqlmetrics IF NOT EXISTS (loggingtime TEXT, StateTEXT)

sqlite3 metrics.db ".mode csv" ".import postgresql.csv postgresqlmetrics" ".exit"




