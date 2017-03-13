DROP TABLE Hospitals;
CREATE TABLE Hospitals AS
SELECT
	provider_id,
	hospital_name,
	state,
	hosp_type AS hospital_type,
	hosp_owner AS hospital_ownership,
	emergency_Services,
	CAST(hospital_overall_rating AS decimal(1,0)) rating
FROM hospitals_raw
;

	
DROP TABLE procedures;
CREATE TABLE procedures AS
SELECT
	ef.measure_id AS measure_id,
	ef.name AS name,
	ef.condition AS condition,
	en.category AS category,
	CAST(en.score AS int) AS national_average,
	CAST(
	concat (substr(ef.measure_start_date, 7, 4),
		'-',
		substr(ef.measure_start_date, 1, 2),
		'-',
		substr(ef.measure_start_date, 4, 2)
		)
	AS date) AS measure_start_date,
	CAST(
	concat (substr(ef.measure_end_date, 7, 4),
		'-',
		substr(ef.measure_end_date, 1, 2),
		'-',
		substr(ef.measure_end_date, 4, 2)
		)
	AS date) AS measure_end_date
	
	
FROM (
	SELECT
		measure_id,
		FIRST(measure_name) AS name,
		FIRST(condition) AS condition,
		FIRST (measure_start_date) AS measure_start_date,
		FIRST (measure_end_date) AS measure_end_date
	FROM effective_care_raw
	GROUP BY measure_id
	)
AS ef LEFT JOIN 
	effective_care_nat_raw AS en
ON (ef.measure_id=en.measure_id)
;


DROP TABLE hospital_procedures;
CREATE TABLE hospital_procedures AS
SELECT
	provider_id,
	measure_id,
	score AS score_raw,
	CAST(score AS int) AS score
FROM effective_care_raw;

DROP TABLE intermed;
CREATE TABLE intermed as
SELECT
      h.state as state,
      hp.provider_id as provider_id,
      hp.measure_id as measure_id,
      hp.score AS score
   FROM hospital_procedures as hp
      JOIN
      hospitals as h
      ON
      (hp.provider_id=h.provider_id)
;


DROP TABLE state_procedures;
CREATE TABLE state_procedures AS
SELECT
    state,
    measure_id,
    AVG(score) AS average_score,
    PERCENTILE(score, 0.50) AS median_score   
FROM intermed
WHERE score IS NOT NULL
GROUP BY state, measure_id
;


DROP TABLE hospital_survey_stars;
CREATE TABLE hospital_survey_stars AS
SELECT
	provider_number AS provider_id,
	HCAHPS_measure_id,
	CAST(patient_survey_star_rating AS TINYINT) AS stars,
	Patient_survey_star_rating_ftnt
FROM survey_reponses_raw
WHERE hcahps_answer_description LIKE '%star rating%'
;

DROP TABLE survey_stars;
CREATE TABLE survey_stars AS
SELECT
	HCAHPS_measure_id,
	FIRST(HCAHPS_question),
	FIRST(HCAHPS_Answer_Description),
	FIRST(CAST(
	concat (substr(measure_start_date, 7, 4),
		'-',
		substr(measure_start_date, 1, 2),
		'-',
		substr(measure_start_date, 4, 2)
		)

	AS date) 
	) AS measure_start_date,
	FIRST(
	CAST(
	concat (substr(measure_end_date, 7, 4),
		'-',
		substr(measure_end_date, 1, 2),
		'-',
		substr(measure_end_date, 4, 2)
		)
	AS date) 
	)AS measure_end_date
FROM survey_responses_raw
WHERE hcahps_answer_description LIKE '%star rating%'
GROUP BY HCAHPS_measure_id
	
	
	
	
