Drop Table hospitals_raw;

CREATE EXTERNAL TABLE hospitals_raw
(
	provider_id string,
	hospital_name string,
	address string,
	city string,
	state string,
	zip string,
	county string,
	phone string,
	hosp_type string,
	hosp_owner string,
	emergency_services string,
	meets_crit_meaningful_EHR string,
	hospital_overall_rating string,
	hospital_overall_rating_ftnt string,
	mortality_natl_comp string,
	mortality_natl_comp_ftnt string,
	safety_care_natl_comp string,
	safety_care_natl_comp_ftnt string,
	readmission_natl_comp string,
	readmission_natl_comp_ftnt string,
	patient_exp_natl_comp string,
	patient_exp_natl_comp_ftnt string,
	effective_care_natl_comp string,
	effective_care_natl_comp_ftnt string,
	timeliness_care_natl_comp string,
	timeliness_care_natl_comp_ftnt string,
	efficient_med_imaging_natl_comp string,
	efficient_med_imaging_natl_comp_ftnt string
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
	"seperatorChar"=',',
	"quoteChar"='"',
	"escapeChar"='\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/hospitals'
;

Drop Table effective_care_raw;

CREATE EXTERNAL TABLE effective_care_raw
(
	provider_id string,
	hospital_name string,
	address string,
	city string,
	state string,
	zip string,
	county string,
	phone string,
	condition string,
	measure_id string,
	measure_name string,
	score string,
	sample string,
	footnote string,
	measure_start_date string,
	measure_end_date string
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
	"seperatorChar"=',',
	"quoteChar"='"',
	"escapeChar"='\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/effective_care'
;

Drop Table effective_care_st_raw;

CREATE EXTERNAL TABLE effective_care_st_raw
(
	state string,
	condition string,
	measure_name string,
	measure_id string,
	score string,
	footnote string,
	measure_start_date string,
	measure_end_date string
	
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
	"seperatorChar"=',',
	"quoteChar"='"',
	"escapeChar"='\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/effective_care_st'
;

Drop Table effective_care_nat_raw;

CREATE EXTERNAL TABLE effective_care_nat_raw
(
	measure_name string,
	measure_id string,
	condition string,
	category string,
	score string,
	footnote string,
	measure_start_date string,
	measure_end_date string
	
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
	"seperatorChar"=',',
	"quoteChar"='"',
	"escapeChar"='\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/effective_care_nat'
;

Drop Table readmissions_raw;

CREATE EXTERNAL TABLE readmissions_raw
(
	provider_id string,
	hospital_name string,
	address string,
	city string,
	state string,
	zip string,
	county string,
	phone string,
	measure_name string,
	measure_id string,
	compared_to_national string,
	denominator string,
	score string,
	lower_estimate string,
	higher_estimate string,
	footnote string,
	measure_start_date string,
	measure_end_date string
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
	"seperatorChar"=',',
	"quoteChar"='"',
	"escapeChar"='\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/readmissions'
;

Drop Table readmissions_st_raw;

CREATE EXTERNAL TABLE readmissions_st_raw
(
	state string,
	measure_name string,
	measure_id string,
	num_hosp_worse string,
	num_hosp_same string,
	num_hosp_better string,
	num_hosp_too_few string,
	footnote string,
	measure_start_date string,
	measure_end_date string
	
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
	"seperatorChar"=',',
	"quoteChar"='"',
	"escapeChar"='\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/readmissions_st'
;

Drop Table readmissions_nat_raw;

CREATE EXTERNAL TABLE readmissions_nat_raw
(
	measure_name string,
	measure_id string,
	national_rate string,
	num_hosp_worse string,
	num_hosp_same string,
	num_hosp_better string,
	num_hosp_too_few string,
	footnote string,
	measure_start_date string,
	measure_end_date string
	
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
	"seperatorChar"=',',
	"quoteChar"='"',
	"escapeChar"='\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/readmissions_nat'
;

Drop Table measures_raw;

CREATE EXTERNAL TABLE measures_raw
(
	measure_name string,
	measure_id string,
	measure_start_qt string,
	measure_start_date string,
	measure_end_qt string,
	measure_end_date string
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
	"seperatorChar"=',',
	"quoteChar"='"',
	"escapeChar"='\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/measures'
;

Drop Table survey_responses_raw;

CREATE EXTERNAL TABLE survey_responses_raw
(
	provider_number string,
	hospital_name string,
	address string,
	city string,
	state string,
	zip string,
	county string,
	phone string,
	HCAHPS_measure_id string,
	HCAHPS_Question string,
	HCAHPS_Answer_Description string,
	Patient_survey_star_rating string,
	Patient_survey_star_rating_ftnt string,	
	HCAHPS_Answer_Percent string,
	HCAHPS_Answer_Percent_ftnt string,
	Number_Completed_Surveys string,
	Number_Completed_Surveys_ftnt string,
	Survey_Reponse_Rate_Percent string,
	Survey_Reponse_Rate_Percent_ftnt string,
	measure_start_date string,
	measure_end_date string
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
	"seperatorChar"=',',
	"quoteChar"='"',
	"escapeChar"='\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/survey_responses'
;

Drop Table survey_national_raw;

CREATE EXTERNAL TABLE survey_national_raw
(
	HCAHPS_measure_id string,
	HCAHPS_Question string,
	HCAHPS_Answer_Description string,
	HCAHPS_Answer_Percent string,
	footnote string,
	measure_start_date string,
	measure_end_date string
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
	"seperatorChar"=',',
	"quoteChar"='"',
	"escapeChar"='\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/survey_national'
;