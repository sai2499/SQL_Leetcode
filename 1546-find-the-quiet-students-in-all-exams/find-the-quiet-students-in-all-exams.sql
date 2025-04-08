WITH sub AS
(SELECT student_id, exam_id, score,
MAX(score) OVER(PARTITION BY exam_id ) AS ma,
MIN(score) OVER(PARTITION BY exam_id) AS mi
FROM Exam)

SELECT DISTINCT e.student_id, student_name
FROM Exam e 
LEFT JOIN Student s
ON e.student_id = s.student_id
WHERE e.student_id NOT IN
(SELECT sub.student_id
FROM sub
WHERE sub.score = ma OR sub.score = mi)
ORDER BY e.student_id