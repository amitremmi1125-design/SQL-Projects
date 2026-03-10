

CREATE DATABASE IF NOT EXISTS student_management;
USE student_management;

CREATE TABLE students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50),
    gender VARCHAR(10),
    dob DATE,
    email VARCHAR(100),
    phone VARCHAR(15),
    city VARCHAR(50),
    admission_date DATE
);

INSERT INTO students (first_name,last_name,gender,dob,email,phone,city,admission_date) VALUES
('Rahul','Sharma','Male','2001-04-10','rahul@gmail.com','9876543210','Delhi','2023-06-01'),
('Ananya','Reddy','Female','2002-07-15','ananya@gmail.com','9876543211','Hyderabad','2023-06-02'),
('Arjun','Patel','Male','2001-09-20','arjun@gmail.com','9876543212','Ahmedabad','2023-06-03'),
('Sneha','Iyer','Female','2002-02-12','sneha@gmail.com','9876543213','Chennai','2023-06-04'),
('Ravi','Kumar','Male','2001-11-30','ravi@gmail.com','9876543214','Bangalore','2023-06-05');

select*
from  students;

CREATE TABLE courses (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(100) NOT NULL,
    duration_months INT,
    course_fee INT
);

INSERT INTO courses (course_name,duration_months,course_fee) VALUES
('SQL Development',6,25000),
('Python Programming',6,30000),
('Data Analytics',8,40000),
('Web Development',6,28000),
('Java Programming',6,27000);

select*
from  courses ;

CREATE TABLE teachers (
    teacher_id INT PRIMARY KEY AUTO_INCREMENT,
    teacher_name VARCHAR(100),
    subject VARCHAR(100),
    email VARCHAR(100)
);

INSERT INTO teachers (teacher_name,subject,email) VALUES
('Suresh Kumar','SQL','suresh@gmail.com'),
('Priya Nair','Python','priya@gmail.com'),
('Amit Singh','Data Analytics','amit@gmail.com'),
('Rohit Sharma','Web Development','rohit@gmail.com'),
('Neha Gupta','Java','neha@gmail.com');

select*
from  teachers ;


CREATE TABLE enrollments (
    enrollment_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    course_id INT,
    teacher_id INT,
    enrollment_date DATE,
    
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id),
    FOREIGN KEY (teacher_id) REFERENCES teachers(teacher_id)
);

INSERT INTO enrollments (student_id,course_id,teacher_id,enrollment_date) VALUES
(1,1,1,'2023-06-10'),
(2,2,2,'2023-06-11'),
(3,3,3,'2023-06-12'),
(4,4,4,'2023-06-13'),
(5,5,5,'2023-06-14');

select*
from enrollments;

CREATE TABLE marks (
    mark_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    course_id INT,
    exam_type VARCHAR(50),
    marks INT,
    
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

INSERT INTO marks (student_id,course_id,exam_type,marks) VALUES
(1,1,'Mid Exam',85),
(1,1,'Final Exam',90),
(2,2,'Mid Exam',78),
(2,2,'Final Exam',88),
(3,3,'Mid Exam',80),
(3,3,'Final Exam',84),
(4,4,'Mid Exam',75),
(4,4,'Final Exam',82),
(5,5,'Mid Exam',79),
(5,5,'Final Exam',87);

select*
from marks;




SELECT 
s.first_name,
c.course_name,
t.teacher_name
FROM enrollments e
JOIN students s ON e.student_id = s.student_id
JOIN courses c ON e.course_id = c.course_id
JOIN teachers t ON e.teacher_id = t.teacher_id;

# Student marks
SELECT 
s.first_name,
c.course_name,
m.exam_type,
m.marks
FROM marks m
JOIN students s ON m.student_id = s.student_id
JOIN courses c ON m.course_id = c.course_id;

#Average marks of students
SELECT 
s.first_name,
AVG(m.marks) AS average_marks
FROM marks m
JOIN students s ON m.student_id = s.student_id
GROUP BY s.first_name;

#Top scoring students
SELECT 
s.first_name,
MAX(m.marks) AS highest_marks
FROM marks m
JOIN students s ON m.student_id = s.student_id
GROUP BY s.first_name;

# Students with marks above 80
SELECT 
s.first_name,
m.marks
FROM marks m
JOIN students s ON m.student_id = s.student_id
WHERE m.marks > 80;

#Count students per course
SELECT 
c.course_name,
COUNT(e.student_id) AS total_students
FROM enrollments e
JOIN courses c ON e.course_id = c.course_id
GROUP BY c.course_name;