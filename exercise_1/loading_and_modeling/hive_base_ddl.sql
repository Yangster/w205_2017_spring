Drop Table hospitals;

CREAT EXTERNAL TABLE hospitals
(
	provider_id string,
	hospital_name string,
	address string
	city string
	zip string
	county string
	phone string
	measure_name string
	measure_id string
	measure_response string
	footnote string
	measure_start_date string
	measure_end_date string
	
	
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
	"seperatorChar"=',',
	"quoteChar"='"',
	"escapeChar"='\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare'
;