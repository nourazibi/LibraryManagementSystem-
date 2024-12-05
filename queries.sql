#Query 1:
SELECT s.name , c.course_name, c.credits
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id;

#Query 2:
SELECT name
FROM Students
WHERE student_id NOT IN (SELECT DISTINCT student_id FROM Enrollments);


#Query 3:

SELECT c.course_name, COUNT(e.student_id) 
FROM Courses c
LEFT JOIN Enrollments e ON c.course_id = e.course_id
GROUP BY c.course_id;

#Query 4: 

SELECT c.course_name, COUNT(e.student_id)
FROM Courses c
JOIN Enrollments e ON c.course_id = e.course_id
GROUP BY c.course_id
HAVING COUNT(e.student_id) > c.capacity / 2;

#Query 5:

SELECT s.name, COUNT(e.course_id) 
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
GROUP BY s.student_id
ORDER BY num_courses DESC
LIMIT 1;

#Query 6:

SELECT s.name, SUM(c.credits) 
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id
GROUP BY s.student_id;

#Query 7:

SELECT c.course_name
FROM Courses c
LEFT JOIN Enrollments e ON c.course_id = e.course_id
WHERE e.student_id IS NULL;