#!/bin/bash
MY_CWD=$(pwd)
mkdir ~/staging
# change to staging directory
cd ~/staging

# get file from data.medicare.gov
MY_URL="https://data.medicare.gov/views/bg9k-emty/files/6c902f45-e28b-42f5-9f96-ae9d1e583472?content_type=application%2Fzip%3B%20charset%3Dbinary&filename=Hospital_Revised_Flatfiles.zip"
wget64 "$MY_URL" -O medicare_data.zip

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



cd $MY_CWD

#clean exit
exit
