CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    gender VARCHAR(10)
);

create table courses(
    course_id int primary key,
    course_name  VARCHAR(50),
    credits INT,
    capacity INT
);

create table Enrollments(
    enrollment_id (INT PRIMARY KEY AUTO_INCREMENT),
    student_id (INT FOREIGN KEY REFERENCES Students(student_id)), 
    course_id (INT FOREIGN KEY REFERENCES Courses(course_id))
);

