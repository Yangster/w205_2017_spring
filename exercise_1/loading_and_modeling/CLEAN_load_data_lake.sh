#!/bin/bash

# mount -t ext4 dev/dvdf /data
# /root/start-hadoop.sh
# /data/start_postgres.sh
# do I also need to get hdfs and postgres started in this shell script?

# save my current directory
MY_CWD=$(pwd)

# create staging directories

#Don't think I need these commands
#su - w205
#/data/start_metastore.sh # need this if start new instance?


#empty and remove staging directories

rm ~/staging/*
rmdir ~/staging

#remove files from HDFS

#rm files in Hdfs directory
hdfs dfs -rm hospitals.csv /user/w205/hospital_compare
hdfs dfs -rm effective_care.csv /user/w205/hospital_compare
hdfs dfs -rm effective_care_st.csv /user/w205/hospital_compare
hdfs dfs -rm effective_care_nat.csv /user/w205/hospital_compare
hdfs dfs -rm readmissions.csv /user/w205/hospital_compare
hdfs dfs -rm readmissions_st.csv /user/w205/hospital_compare
hdfs dfs -rm readmissions_nat.csv /user/w205/hospital_compare
hdfs dfs -rm measures.csv /user/w205/hospital_compare
hdfs dfs -rm survey_responses.csv /user/w205/hospital_compare

#remove HDFS dirctory
hdfs dfs -rmdir /user/w205/hospital_compare
#change directory to original


cd $MY_CWD

#clean exit
exit
