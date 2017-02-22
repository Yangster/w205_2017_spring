#mount -t ext4 dev/dvdf /data

#/root/start-hadoop.sh
#/data/start_postgres.sh
#do I also need to get hdfs and postgres started in this shell script?
#su - w205
#/data/start_metastore.sh
MY_URL="https://data.medicare.gov/views/bg9k-emty/files/6c902f45-e28b-42f5-9f96-ae9d1e583472?content_type=application%2Fzip%3B%20charset%3Dbinary&filename=Hospital_Revised_Flatfiles.zip"
wget "$MY_URL" -O medicare_data.zip
unzip medicare_data.zip
tail -n +2 "Hospital General Information.csv">hospitals.csv
tail -n +2 "Timely and Effective Care - Hospital.csv">effective_care.csv
tail -n +2 "Timely and Effective Care - State.csv">effective_care_st.csv
tail -n +2 "Timely and Effective Care - National.csv">state_effective_nat.csv
tail -n +2 "Readmissions and Deaths - Hospital.csv">readmissions.csv
tail -n +2 "Readmissions and Deaths - State.csv">readmissions_st.csv
tail -n +2 "Readmissions and Deaths - National.csv">readmissions_nat.csv
tail -n +2 "Measure Dates.csv">Measures.csv
tail -n +2 "hvbp_hcahps_05_28_2015.csv">survey_responses.csv
hdfs dfs -mkdir /user/w205/hospital_compare
hdfs dfs -put hospitals.csv /user/w205/hospital_compare