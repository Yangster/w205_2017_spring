DROP TABLE procedure_std;
CREATE TABLE procedure_std AS
SELECT measure_id, stddev_samp(score) as measure_std
FROM hospital_procedures
WHERE score IS NOT NULL
GROUP BY measure_id;

DROP TABLE procedure_std_norm;
CREATE TABLE procedure_std_norm AS
SELECT std.measure_id as measure_id, (std.measure_std/p.national_average) as norm_std
FROM procedure_std as std
JOIN procedures as p
ON (std.measure_id=p.measure_id)
;

DROP TABLE most_var_procedures;
CREATE TABLE most_var_procedures AS
SELECT
    p.name as name,
    p.condition as condition,
    std.norm_std as norm_std
FROM procedure_std_norm AS std
LEFT JOIN procedures AS p
ON (std.measure_id=p.measure_id);


select * from most_var_procedures order by norm_std desc limit 10;