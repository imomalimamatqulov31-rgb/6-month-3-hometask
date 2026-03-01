--one to one, one to many, many to many bog'lanishlarga misollar;

--one to one bog'lanish uchun misol:
CREATE TABLE instagramuser(
    id SERIAL PRIMARY KEY,
    firstname VARCHAR(255) NOT NULL,
    lastname VARCHAR(255) NOT NULL,
    bio TEXT NOT NULL, 
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)

INSERT INTO instagramuser (firstname, lastname, bio) VALUES
('Sardorbek', 'Sardorov', 'Hello, I am Sardorbek!'),
('Firdavsbek', 'Zoitov', 'Hello, I am Firdavsbek!'),
('Shaxzodbek', 'Shaxzodov', 'Hello, I am Shaxzodbek!');


CREATE TABLE instagramprofile(
    id SERIAL PRIMARY KEY,
    profile_name VARCHAR(255) NOT NULL,
    user_id INT UNIQUE REFERENCES instagramuser(id) ON DELETE CASCADE
    
)

INSERT INTO instagramprofile (profile_name, user_id) VALUES
('sardorbek_sardorov', 1),
('firdavsbek_zoitov', 2)



--one to many bog'lanish uchun misol:

CREATE TABLE insgtagramposters(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    surname VARCHAR(255) NOT NULL
)

INSERT INTO insgtagramposters (name, surname) VALUES
('Sardorbek', 'Sardorov'),
('Firdavsbek', 'Zoitov'),
('Shaxzodbek', 'Shaxzodov');

CREATE TABLE instagramposts(
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    poster_id INT REFERENCES insgtagramposters(id) ON DELETE CASCADE
)

INSERT INTO instagramposts (title, content, poster_id) VALUES
('My first post', 'This is my first post on Instagram!', 1),
('My second post', 'This is my second post on Instagram!', 1),
('Hello world', 'Hello everyone! This is my first post.', 2),
('Good morning', 'Wishing you all a great day ahead!', 3);


--many to many bog'lanish uchun misol:

CREATE TABLE students(
    id SERIAL PRIMARY KEY,
    fullname VARCHAR(255) NOT NULL
);

INSERT INTO students (fullname) VALUES
('Imomali Rahmon'),
('Donald Trump'),
('Vladimir Putin');

CREATE TABLE COURSES(
    id SERIAL PRIMARY KEY,
    course_name VARCHAR(255) NOT NULL
 
);

INSERT INTO COURSES (course_name) VALUES
('Mathematics'),
('Physics'),
('Chemistry');

CREATE TABLE students_courses(
    id SERIAL PRIMARY KEY,
    student_id INT REFERENCES students(id) ON DELETE CASCADE,
    course_id INT REFERENCES COURSES(id) ON DELETE CASCADE
);

INSERT INTO students_courses (student_id, course_id) VALUES
(1, 1),
(1, 2),
(2, 1),
(2, 3),
(3, 2),
(3, 3);

SELECT s.fullname, c.course_name
FROM students_courses sc
JOIN students s ON s.id = sc.student_id
JOIN courses c ON c.id = sc.course_id;