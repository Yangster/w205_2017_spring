DROP TABLE procedure_std;
CREATE TABLE procedure_std AS
SELECT measure_id, stddev_samp(score) as measure_std
FROM hospital_procedures
WHERE score IS NOT NULL
GROUP BY measure_id;


DROP TABLE normalized_hosp_scores;
CREATE TABLE normalized_hosp_scores AS
SELECT hp.provider_id AS provider_id, hp.measure_id as measure_id, hp.score as score, 
p.description as description, p.national_average as national_average,
    CASE 
        when p.description LIKE '%Higher%better%' OR p.description LIKE '%higher%better%'  THEN ((hp.score-p.national_average)/std.measure_std)
        when p.description LIKE '%Lower%better%' OR p.description LIKE '%lower%better%' THEN ((p.national_average-hp.score)/std.measure_std)
        ELSE NULL
    End as normalized_score
FROM hospital_procedures AS hp 
JOIN procedures as p
ON (hp.measure_id=p.measure_id)
JOIN procedure_std AS std
ON (std.measure_id=p.measure_id)
WHERE hp.score IS NOT NULL
;

DROP TABLE best_hosp_ids;

CREATE TABLE best_hosp_ids as
select provider_id, avg(normalized_score) as avg_score 
FROM normalized_hosp_scores
WHERE normalized_score IS NOT NULL
GROUP BY provider_id
;


DROP TABLE best_hosps;
CREATE TABLE best_hosps AS
SELECT
    hid.provider_id,
    h.hospital_name,
    h.state,
    h.hospital_type,
    h.hospital_ownership,
    hid.avg_score
FROM
best_hosp_ids as hid LEFT JOIN hospitals as h
ON (hid.provider_id=h.provider_id)
;


select * from best_hosps order by avg_score desc limit 10;