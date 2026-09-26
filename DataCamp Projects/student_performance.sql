-- Do more study hours and extracurricular activities lead to better scores?
SELECT hours_studied, AVG(exam_score) AS avg_exam_score
FROM student_performance
WHERE hours_studied > 10 AND extracurricular_activities = 'Yes'
GROUP BY hours_studied
ORDER BY hours_studied DESC
LIMIT 30;

-- Is there a sweet spot for study hours? Explore how different ranges of study hours impact exam performance by calculating the average exam score for each study range.
SELECT AVG(exam_score) as avg_exam_score,
	CASE WHEN hours_studied >= 16 THEN '16+ hours'
	WHEN hours_studied < 16 AND hours_studied >= 11 THEN '11-15 hours'
	WHEN hours_studied < 11 AND hours_studied >= 6 THEN '6-10 hours'
	WHEN hours_studied < 6 AND hours_studied >= 1 THEN '1-5 hours'
	END AS hours_studied_range
FROM student_performance
GROUP BY hours_studied_range
ORDER BY avg_exam_score DESC

-- A teacher wants to show their students their relative rank in the class, without revealing their exam scores to each other.
SELECT attendance, hours_studied, sleep_hours, tutoring_sessions, 
	DENSE_RANK() OVER (ORDER BY exam_score DESC) exam_rank
FROM student_performance
ORDER BY exam_rank ASC
LIMIT 30;