Drop Table hospitals;

CREATE EXTERNAL TABLE hospitals
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

Drop Table effective_care;

CREATE EXTERNAL TABLE effective_care
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

Drop Table effective_care_st;

CREATE EXTERNAL TABLE effective_care_st
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

Drop Table effective_care_nat;

CREATE EXTERNAL TABLE effective_care_nat
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

Drop Table readmissions;

CREATE EXTERNAL TABLE readmissions
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

Drop Table readmissions_st;

CREATE EXTERNAL TABLE readmissions_st
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

Drop Table readmissions_nat;

CREATE EXTERNAL TABLE readmissions_nat
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

Drop Table measures;

CREATE EXTERNAL TABLE measures
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

Drop Table survey_responses;

CREATE EXTERNAL TABLE survey_responses
(
	provider_number string,
	hospital_name string,
	address string,
	city string,
	state string,
	zip string,
	county string,
	communications_with_nurses_floor string,
	communications_with_nurses_achievement_threshold string,
	communications_with_nurses_benchmark string,
	communications_with_nurses_baseline_rate string,
	communications_with_nurses_performance_rate string,
	communications_with_nurses_achievement_points string,
	communications_with_nurses_improvement_points string,
	communications_with_nurses_dimension_score string,
	
	communications_with_doctors_floor string,
	communications_with_doctors_achievement_threshold string,
	communications_with_doctors_benchmark string,
	communications_with_doctors_baseline_rate string,
	communications_with_doctors_performance_rate string,
	communications_with_doctors_achievement_points string,
	communications_with_doctors_improvement_points string,
	communications_with_doctors_dimension_score string,
	
	responsiveness_of_hospital_staff_floor string,
	responsiveness_of_hospital_staff_achievement_threshold string,
	responsiveness_of_hospital_staff_benchmark string,
	responsiveness_of_hospital_staff_baseline_rate string,
	responsiveness_of_hospital_staff_performance_rate string,
	responsiveness_of_hospital_staff_achievement_points string,
	responsiveness_of_hospital_staff_improvement_points string,
	responsiveness_of_hospital_staff_dimension_score string,
	
	pain_management_floor string,
	pain_management_achievement_threshold string,
	pain_management_benchmark string,
	pain_management_baseline_rate string,
	pain_management_performance_rate string,
	pain_management_achievement_points string,
	pain_management_improvement_points string,
	pain_management_dimension_score string,
	
	communication_about_medicines_floor string,
	communication_about_medicines_achievement_threshold string,
	communication_about_medicines_benchmark string,
	communication_about_medicines_baseline_rate string,
	communication_about_medicines_performance_rate string,
	communication_about_medicines_achievement_points string,
	communication_about_medicines_improvement_points string,
	communication_about_medicines_dimension_score string,
	
	cleanliness_and_quietness_floor string,
	cleanliness_and_quietness_achievement_threshold string,
	cleanliness_and_quietness_benchmark string,
	cleanliness_and_quietness_baseline_rate string,
	cleanliness_and_quietness_performance_rate string,
	cleanliness_and_quietness_achievement_points string,
	cleanliness_and_quietness_improvement_points string,
	cleanliness_and_quietness_dimension_score string,
	
	discharge_information_floor string,
	discharge_information_achievement_threshold string,
	discharge_information_benchmark string,
	discharge_information_baseline_rate string,
	discharge_information_performance_rate string,
	discharge_information_achievement_points string,
	discharge_information_improvement_points string,
	discharge_information_dimension_score string,
	
	overall_rating_floor string,
	overall_rating_achievement_threshold string,
	overall_rating_benchmark string,
	overall_rating_baseline_rate string,
	overall_rating_performance_rate string,
	overall_rating_achievement_points string,
	overall_rating_improvement_points string,
	overall_rating_dimension_score string,
	
	HCAHPS_base_score string,
	HCAHPS_consistency_score string
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