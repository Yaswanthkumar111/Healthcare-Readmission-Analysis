CREATE DATABASE healthcare;

USE healthcare;

RENAME TABLE patient TO patients;

SELECT * FROM patients LIMIT 5;

SELECT COUNT(DISTINCT patient_id) AS total_patients FROM patients;

SELECT AVG(readmission_flag) * 100 AS readmission_rate FROM patients;

SELECT AVG(length_of_stay) AS avg_stay FROM patients;

SELECT age_group, AVG(readmission_flag) * 100 AS readmission_rate FROM patients GROUP BY age_group;

SELECT 
    patient_id,
    date_of_admission,
    LAG(date_of_admission) OVER (
        PARTITION BY patient_id 
        ORDER BY date_of_admission
    ) AS previous_visit
FROM patients;