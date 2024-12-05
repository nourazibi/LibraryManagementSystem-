INSERT INTO Students (student_id, name, age, gender) VALUES
(1, 'Nour Laazibi', 20, 'Female'),
(2, 'Hajerr ben  ', 21, 'Female'),
(3, 'Lilia ben ', 22, 'Female'),
(4, 'Maram lach', 23, 'Female'),
(5, 'Fadi laa', 20, 'Male');

INSERT INTO Courses (course_id, course_name, credits, capacity) VALUES
(1, 'Math', 3, 2),
(2, 'Histoire', 4, 3),
(3, 'Informatique', 3, 3),
(4, 'Science', 2, 2);

INSERT INTO Enrollments (student_id, course_id) VALUES
(1, 1),
(1, 2),
(2, 3),
(2, 4),
(3, 1),
(3, 3),
(4, 2),
(5, 4);
