drop table Hospitals;
create table Hospitals as
select
	provider_id as hospital_id,
	hospital_name,
	state,
	hosp_type as hospital_type,
	hosp_owner as hospital_ownership
	emergency_Services
	cast(hospital_overall_rating as decimal(1,0)) rating
from hospitals_raw
where hospital_overall_Rating not like 'Not%'
;

	
drop table measures;
create table measures as
select 
	measure_name,
	measure_id,
	score as national_avg,
	footnote,
	concat (substr(measure_start_date, 7, 4),
		'-',
		substr(measure_start_date, 1, 2),
		'-',
		substr(measure_start_date, 4, 2)
		)
	as date) as measure_start_date,
	--can cast it with the same name? think so
	concat (substr(measure_end_date, 7, 4),
		'-',
		substr(measure_end_date, 1, 2),
		'-',
		substr(measure_end_date, 4, 2)
		)
	as date) as measure_end_date
from effective_care_nat_raw
UNION ALL
SELECT
	measure_name,
	measure_id,
	national_rate as national_avg
	concat (substr(measure_start_date, 7, 4),
		'-',
		substr(measure_start_date, 1, 2),
		'-',
		substr(measure_start_date, 4, 2)
		)
	as date) as measure_start_date,
	--can cast it with the same name? think so
	concat (substr(measure_end_date, 7, 4),
		'-',
		substr(measure_end_date, 1, 2),
		'-',
		substr(measure_end_date, 4, 2)
		)
	as date) as measure_end_date
from readmissions_nat_raw
;

DROP TABLE Hospital_Measures;
CREATE TABLE Hopsital_Measures as
select
	provider_id,
	hospital_name,
	measure_id,
	measure_name,
	score
from effective_care_raw
UNION all
select
	provider_id,
	hospital_name,
	measure_id,
	measure_name,
	score,
	
	
	
	
