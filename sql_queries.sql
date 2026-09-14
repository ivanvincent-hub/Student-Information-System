SELECT
    student_id,
    first_name,
    last_name,
    email
FROM students
WHERE program_id = 1;

SELECT
    s.student_id,
    s.first_name,
    s.last_name,
    p.program_name
FROM students s
JOIN programs p
    ON s.program_id = p.program_id;

SELECT
    s.first_name,
    s.last_name,
    c.course_code,
    c.course_name,
    e.grade
FROM enrollments e
JOIN students s
    ON e.student_id = s.student_id
JOIN sections sec
    ON e.section_id = sec.section_id
JOIN courses c
    ON sec.course_id = c.course_id
ORDER BY s.last_name;

SELECT
    p.program_name,
    COUNT(s.student_id) AS number_of_students
FROM programs p
LEFT JOIN students s
    ON p.program_id = s.program_id
GROUP BY p.program_id, p.program_name;

SELECT
    c.course_code,
    c.course_name,
    ROUND(AVG(e.grade), 2) AS average_grade
FROM courses c
JOIN sections sec
    ON c.course_id = sec.course_id
JOIN enrollments e
    ON sec.section_id = e.section_id
GROUP BY c.course_id, c.course_code, c.course_name;
