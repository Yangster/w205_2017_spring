#!/bin/bash
MY_CWD=$(pwd)
mkdir ~/staging
mkdir ~/staging/ex1
mkdir ~/staging/ex1/dump
mkdir ~/staging/ex1/clean
# change to staging directory
cd ~/staging/ex1/dump

# get file from data.medicare.gov
MY_URL="https://data.medicare.gov/views/bg9k-emty/files/6c902f45-e28b-42f5-9f96-ae9d1e583472?content_type=application%2Fzip%3B%20charset%3Dbinary&filename=Hospital_Revised_Flatfiles.zip"
wget64 "$MY_URL" -O medicare_data.zip

# unzip the Medicare data
unzip medicare_data.zip

#remove column header and rename files
tail -n +2 "Hospital General Information.csv">~/staging/ex1/clean/hospitals.csv
mv "Hospital General Information.csv" ~/staging/ex1/clean/"Hospital General Information.csv"
tail -n +2 "Timely and Effective Care - Hospital.csv">~/staging/ex1/clean/effective_care.csv
mv "Timely and Effective Care - Hospital.csv" ~/staging/ex1/clean/"Timely and Effective Care - Hospital.csv"
tail -n +2 "Timely and Effective Care - State.csv">~/staging/ex1/clean/effective_care_st.csv
mv "Timely and Effective Care - State.csv" ~/staging/ex1/clean/"Timely and Effective Care - State.csv"
tail -n +2 "Timely and Effective Care - National.csv">~/staging/ex1/clean/effective_care_nat.csv
mv "Timely and Effective Care - National.csv" ~/staging/ex1/clean/"Timely and Effective Care - National.csv"
tail -n +2 "Readmissions and Deaths - Hospital.csv">~/staging/ex1/clean/readmissions.csv
mv "Readmissions and Deaths - Hospital.csv" ~/staging/ex1/clean/"Readmissions and Deaths - Hospital.csv"
tail -n +2 "Readmissions and Deaths - State.csv">~/staging/ex1/clean/readmissions_st.csv
mv "Readmissions and Deaths - State.csv" ~/staging/ex1/clean/"Readmissions and Deaths - State.csv"
tail -n +2 "Readmissions and Deaths - National.csv">~/staging/ex1/clean/readmissions_nat.csv
mv "Readmissions and Deaths - National.csv" ~/staging/ex1/clean/"Readmissions and Deaths - National.csv"
tail -n +2 "Measure Dates.csv">~/staging/ex1/clean/measures.csv
mv "Measure Dates.csv" ~/staging/ex1/clean/"Measure Dates.csv"
tail -n +2 "HCAHPS_Hospital.csv">~/staging/ex1/clean/survey_responses.csv
mv "HCAHPS_Hospital.csv" ~/staging/ex1/clean/"HCAHPS_Hospital.csv"

cd ~/staging/ex1
#rm -r ~/staging/ex1/dump/*
#rmdir  ~/staging/ex1/dump



cd $MY_CWD

#clean exit
exit
