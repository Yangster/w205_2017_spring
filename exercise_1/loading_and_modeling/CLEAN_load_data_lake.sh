#!/bin/bash

# save my current directory
MY_CWD=$(pwd)

#empty and remove staging directories

rm -r ~/staging/exercise_1/*
rmdir ~/staging/exercise_1
rmdir ~/staging

#remove files from HDFS

#rm files in Hdfs directory
hdfs dfs -rm /user/w205/hospital_compare/hospitals/hospitals.csv
hdfs dfs -rm /user/w205/hospital_compare/effective_care/effective_care.csv
hdfs dfs -rm /user/w205/hospital_compare/effective_care_st/effective_care_st.csv
hdfs dfs -rm /user/w205/hospital_compare/effective_care_nat/effective_care_nat.csv
hdfs dfs -rm /user/w205/hospital_compare/readmissions/readmissions.csv
hdfs dfs -rm /user/w205/hospital_compare/readmissions_st/readmissions_st.csv
hdfs dfs -rm /user/w205/hospital_compare/readmissions_nat/readmissions_nat.csv
hdfs dfs -rm /user/w205/hospital_compare/measures/measures.csv
hdfs dfs -rm /user/w205/hospital_compare/survey_responses/survey_responses.csv

hdfs dfs -rmdir /user/w205/hospital_compare/hospitals
hdfs dfs -rmdir /user/w205/hospital_compare/effective_care
hdfs dfs -rmdir /user/w205/hospital_compare/effective_care_st
hdfs dfs -rmdir /user/w205/hospital_compare/effective_care_nat
hdfs dfs -rmdir /user/w205/hospital_compare/readmissions
hdfs dfs -rmdir /user/w205/hospital_compare/readmissions_st
hdfs dfs -rmdir /user/w205/hospital_compare/readmissions_nat
hdfs dfs -rmdir /user/w205/hospital_compare/measures/measures.csv
hdfs dfs -rmdir /user/w205/hospital_compare/survey_responses



#remove HDFS dirctory
hdfs dfs -rmdir /user/w205/hospital_compare
#change directory to original


cd $MY_CWD

#clean exit
exit
