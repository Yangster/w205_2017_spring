DROP TABLE avg_med_star_hosp;
CREATE TABLE avg_med_star_hosp as
SELECT provider_id, avg(stars) as avg_stars, percentile(stars,0.5) as med_stars
FROM hospital_survey_stars
WHERE stars IS NOT NULL
GROUP BY provider_id
;


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


DROP TABLE correlation_stars_score
CREATE TABLE correlation_stars_score AS
SELECT corr(star.avg_stars,score.avg_score) as correlation_avg
FROM avg_med_star_hosp as star
JOIN best_hosp_ids as score
ON (STAR.provider_id=score.provider_id)
;