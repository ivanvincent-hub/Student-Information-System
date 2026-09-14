DROP TABLE IF EXISTS enrollments;
DROP TABLE IF EXISTS sections;
DROP TABLE IF EXISTS courses;
DROP TABLE IF EXISTS instructors;
DROP TABLE IF EXISTS students;
DROP TABLE IF EXISTS programs;
DROP TABLE IF EXISTS departments;

DROP TABLE IF EXISTS shippings;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customers;

CREATE TABLE departments (
    department_id INTEGER PRIMARY KEY AUTOINCREMENT,
    department_name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE programs (
    program_id INTEGER PRIMARY KEY AUTOINCREMENT,
    program_name VARCHAR(100) NOT NULL,
    department_id INTEGER NOT NULL,
    FOREIGN KEY (department_id)
        REFERENCES departments(department_id)
);

CREATE TABLE students (
    student_id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    birth_date DATE,
    program_id INTEGER NOT NULL,
    FOREIGN KEY (program_id)
        REFERENCES programs(program_id)
);

CREATE TABLE instructors (
    instructor_id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    department_id INTEGER NOT NULL,
    FOREIGN KEY (department_id)
        REFERENCES departments(department_id)
);

CREATE TABLE courses (
    course_id INTEGER PRIMARY KEY AUTOINCREMENT,
    course_code VARCHAR(20) NOT NULL UNIQUE,
    course_name VARCHAR(100) NOT NULL,
    units INTEGER NOT NULL,
    department_id INTEGER NOT NULL,
    FOREIGN KEY (department_id)
        REFERENCES departments(department_id)
);

CREATE TABLE sections (
    section_id INTEGER PRIMARY KEY AUTOINCREMENT,
    section_name VARCHAR(20) NOT NULL,
    course_id INTEGER NOT NULL,
    instructor_id INTEGER NOT NULL,
    semester VARCHAR(20) NOT NULL,
    school_year VARCHAR(20) NOT NULL,
    FOREIGN KEY (course_id)
        REFERENCES courses(course_id),
    FOREIGN KEY (instructor_id)
        REFERENCES instructors(instructor_id)
);

CREATE TABLE enrollments (
    enrollment_id INTEGER PRIMARY KEY AUTOINCREMENT,
    student_id INTEGER NOT NULL,
    section_id INTEGER NOT NULL,
    enrollment_date DATE NOT NULL,
    grade DECIMAL(4,2),
    FOREIGN KEY (student_id)
        REFERENCES students(student_id),
    FOREIGN KEY (section_id)
        REFERENCES sections(section_id)
);

INSERT INTO departments (department_name) VALUES
('College of Information Technology'),
('College of Business'),
('College of Engineering'),
('College of Education');

INSERT INTO programs (program_name, department_id) VALUES
('Bachelor of Science in Information Technology', 1),
('Bachelor of Science in Business Administration', 2),
('Bachelor of Science in Computer Engineering', 3),
('Bachelor of Secondary Education', 4);

INSERT INTO students
(first_name, last_name, email, birth_date, program_id)
VALUES
('Juan', 'Dela Cruz', 'juan.delacruz@email.com', '2005-03-15', 1),
('Maria', 'Santos', 'maria.santos@email.com', '2004-08-22', 1),
('Carlos', 'Reyes', 'carlos.reyes@email.com', '2005-01-10', 1),
('Angela', 'Garcia', 'angela.garcia@email.com', '2004-11-30', 2),
('Miguel', 'Torres', 'miguel.torres@email.com', '2005-06-18', 3),
('Sofia', 'Ramos', 'sofia.ramos@email.com', '2004-09-05', 4),
('Daniel', 'Cruz', 'daniel.cruz@email.com', '2005-02-27', 1),
('Patricia', 'Mendoza', 'patricia.mendoza@email.com', '2004-12-12', 2);

INSERT INTO instructors
(first_name, last_name, email, department_id)
VALUES
('Robert', 'Anderson', 'robert.anderson@school.edu', 1),
('Elizabeth', 'Wilson', 'elizabeth.wilson@school.edu', 1),
('James', 'Taylor', 'james.taylor@school.edu', 2),
('Linda', 'Moore', 'linda.moore@school.edu', 3),
('Michael', 'Thomas', 'michael.thomas@school.edu', 4);

INSERT INTO courses
(course_code, course_name, units, department_id)
VALUES
('IT101', 'Introduction to Information Technology', 3, 1),
('IT102', 'Database Management Systems', 3, 1),
('IT103', 'Web Development', 3, 1),
('BA101', 'Principles of Management', 3, 2),
('CE101', 'Computer Engineering Fundamentals', 3, 3),
('ED101', 'Foundations of Education', 3, 4);

INSERT INTO sections
(section_name, course_id, instructor_id, semester, school_year)
VALUES
('BSIT-1A', 1, 1, '1st Semester', '2026-2027'),
('BSIT-1B', 1, 2, '1st Semester', '2026-2027'),
('BSIT-2A', 2, 1, '1st Semester', '2026-2027'),
('BSIT-2B', 3, 2, '1st Semester', '2026-2027'),
('BSBA-1A', 4, 3, '1st Semester', '2026-2027'),
('BSCPE-1A', 5, 4, '1st Semester', '2026-2027'),
('BSED-1A', 6, 5, '1st Semester', '2026-2027');

INSERT INTO enrollments
(student_id, section_id, enrollment_date, grade)
VALUES
(1, 1, '2026-08-05', 1.50),
(1, 3, '2026-08-05', 1.75),
(1, 4, '2026-08-05', 1.25),

(2, 1, '2026-08-05', 1.75),
(2, 3, '2026-08-05', 2.00),
(2, 4, '2026-08-05', 1.50),

(3, 2, '2026-08-06', 2.00),
(3, 3, '2026-08-06', 1.75),

(4, 5, '2026-08-06', 1.50),
(5, 6, '2026-08-06', 1.75),

(6, 7, '2026-08-07', 1.25),
(7, 1, '2026-08-07', 2.25),
(7, 3, '2026-08-07', 2.00),
(8, 5, '2026-08-07', 1.75);
