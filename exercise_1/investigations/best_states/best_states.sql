DROP TABLE procedure_std;
CREATE TABLE procedure_std AS
SELECT measure_id, stddev_samp(score) as measure_std
FROM hospital_procedures
WHERE score IS NOT NULL
GROUP BY measure_id;


DROP TABLE normalized_state_scores;
CREATE TABLE normalized_state_scores AS
SELECT sp.state AS state, sp.measure_id as measure_id, sp.average_score as score, 
p.description as description, p.national_average as national_average,
    CASE 
        when p.description LIKE '%Higher%better%' OR p.description LIKE '%higher%better%'  THEN ((sp.average_score-p.national_average)/std.measure_std)
        when p.description LIKE '%Lower%better%' OR p.description LIKE '%lower%better%' THEN ((p.national_average-sp.average_score)/std.measure_std)
        ELSE NULL
    End as normalized_score
FROM state_procedures AS sp
JOIN procedures as p
ON (sp.measure_id=p.measure_id)
JOIN procedure_std AS std
ON (std.measure_id=p.measure_id)
WHERE sp.average_score IS NOT NULL
;

DROP TABLE best_states;
CREATE TABLE best_states as
select state, avg(normalized_score) as avg_score 
FROM normalized_state_scores
WHERE normalized_score IS NOT NULL
GROUP BY state
;



select * from best_states order by avg_score desc limit 10;