CREATE TABLE state_procedures AS
SELECT
   state,
   measure_id,
   AVG(score) AS average_score,
   PERCENTILE(score, 0.50) AS median_score   
FROM(
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
   )
WHERE score IS NOT null
GROUP BY state, measure_id
ORDER BY state desc
;

CREATE TABLE state_procedures AS
SELECT
    state,
    measure_id,
    FIRST(SCORE)
FROM(
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
   )
GROUP BY h.state, hp.measure_id
ORDER BY h.state desc
;


SELECT
    state,
    measure_id,
    FIRST(score) as score
FROM intermed
GROUP BY state, measure_id
ORDER BY state desc
;

SELECT
   state,
   measure_id,
   AVG(score) AS average_score,
   PERCENTILE(score, 0.50) AS median_score   
FROM intermed
WHERE score IS NOT null
GROUP BY state, measure_id
ORDER BY state desc
;
