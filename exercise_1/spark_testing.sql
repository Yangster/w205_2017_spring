drop table test_measures;
CREATE TABLE test_measures as
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
	score
from readmissions_raw;