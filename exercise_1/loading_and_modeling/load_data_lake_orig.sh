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

mkdir ~/staging
mkdir ~/staging/exercise_1


# change to staging directory
cd ~/staging/exercise_1

# get file from data.medicare.gov
MY_URL="https://data.medicare.gov/views/bg9k-emty/files/6c902f45-e28b-42f5-9f96-ae9d1e583472?content_type=application%2Fzip%3B%20charset%3Dbinary&filename=Hospital_Revised_Flatfiles.zip"
wget "$MY_URL" -O medicare_data.zip

# unzip the Medicare data
unzip medicare_data.zip

#remove column header and rename files
tail -n +2 "Hospital General Information.csv">hospitals.csv
tail -n +2 "Timely and Effective Care - Hospital.csv">effective_care.csv
tail -n +2 "Timely and Effective Care - State.csv">effective_care_st.csv
tail -n +2 "Timely and Effective Care - National.csv">effective_care_nat.csv
tail -n +2 "Readmissions and Deaths - Hospital.csv">readmissions.csv
tail -n +2 "Readmissions and Deaths - State.csv">readmissions_st.csv
tail -n +2 "Readmissions and Deaths - National.csv">readmissions_nat.csv
tail -n +2 "Measure Dates.csv">measures.csv
tail -n +2 "hvbp_hcahps_11_10_2016.csv">survey_responses.csv


#Create main HDFS Directory
hdfs dfs -mkdir /user/w205/hospital_compare

#Create hdfs director each file and put files in Hdfs directory
hdfs dfs -mkdir /user/w205/hospital_compare/hospitals
hdfs dfs -put hospitals.csv /user/w205/hospital_compare/hospitals

hdfs dfs -mkdir /user/w205/hospital_compare/effective_care
hdfs dfs -put effective_care.csv /user/w205/hospital_compare/effective_care

hdfs dfs -mkdir /user/w205/hospital_compare/effective_care_st
hdfs dfs -put effective_care_st.csv /user/w205/hospital_compare/effective_care_st

hdfs dfs -mkdir /user/w205/hospital_compare/effective_care_nat
hdfs dfs -put effective_care_nat.csv /user/w205/hospital_compare/effective_care_nat

hdfs dfs -mkdir /user/w205/hospital_compare/readmissions
hdfs dfs -put readmissions.csv /user/w205/hospital_compare/readmissions

hdfs dfs -mkdir /user/w205/hospital_compare/readmissions_st
hdfs dfs -put readmissions_st.csv /user/w205/hospital_compare/readmissions_st

hdfs dfs -mkdir /user/w205/hospital_compare/readmissions_nat
hdfs dfs -put readmissions_nat.csv /user/w205/hospital_compare/readmissions_nat

hdfs dfs -mkdir /user/w205/hospital_compare/measures
hdfs dfs -put measures.csv /user/w205/hospital_compare/measures

hdfs dfs -mkdir /user/w205/hospital_compare/survey_responses
hdfs dfs -put survey_responses.csv /user/w205/hospital_compare/survey_responses

#change directory to original

cd $MY_CWD

#clean exit
exit
