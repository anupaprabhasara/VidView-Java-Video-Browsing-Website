-- ========================================
-- 1. Create Database and Use It
-- ========================================
CREATE DATABASE IF NOT EXISTS vidview_db;
USE vidview_db;

-- ========================================
-- 2. Table: users
-- ========================================
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO users (full_name, email, password) VALUES
('John Doe', 'john@example.com', 'hashed123'),
('Alice Perera', 'alice@example.com', 'hashed456');

-- ========================================
-- 3. Table: admins
-- ========================================
CREATE TABLE admins (
    admin_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO admins (full_name, email, password) VALUES
('Admin One', 'admin1@example.com', 'adminpass1'),
('Admin Two', 'admin2@example.com', 'adminpass2'),
('Admin Three', 'admin3@example.com', 'adminpass3');

-- ========================================
-- 4. Table: videos
-- ========================================
CREATE TABLE videos (
    video_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    description TEXT,
    youtube_url VARCHAR(255) NOT NULL,
    uploaded_by INT,
    uploaded_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (uploaded_by) REFERENCES admins(admin_id) ON DELETE SET NULL
);

INSERT INTO videos (title, description, youtube_url, uploaded_by) VALUES
('Java Tutorial for Beginners', 'Learn Java basics with this video.', 'https://www.youtube.com/watch?v=eIrMbAQSU34', 1),
('HTML + CSS Full Course', 'Front-end skills for Java developers.', 'https://www.youtube.com/watch?v=mU6anWqZJcc', 1),
('JavaScript Fundamentals', 'Master the basics of JavaScript programming.', 'https://www.youtube.com/watch?v=upDLs1sn7g4', 2),
('Spring Boot Tutorial', 'Create REST APIs with Spring Boot.', 'https://www.youtube.com/watch?v=vtPkZShrvXQ', 1),
('MySQL Full Course', 'Learn MySQL from scratch in one video.', 'https://www.youtube.com/watch?v=7S_tz1z_5bA', 3),
('Git and GitHub Crash Course', 'Version control using Git and GitHub.', 'https://www.youtube.com/watch?v=RGOj5yH7evk', 2),
('Responsive Web Design', 'Build responsive websites with HTML/CSS.', 'https://www.youtube.com/watch?v=srvUrASNj0s', 1),
('Object Oriented Programming in Java', 'Understand OOP concepts in Java.', 'https://www.youtube.com/watch?v=2oFKNL7vYV8', 3),
('Node.js Crash Course', 'Introduction to server-side JavaScript.', 'https://www.youtube.com/watch?v=fBNz5xF-Kx4', 1),
('Data Structures in Java', 'Learn essential data structures using Java.', 'https://www.youtube.com/watch?v=RBSGKlAvoiM', 3),
('REST API Design Best Practices', 'Designing scalable RESTful APIs.', 'https://www.youtube.com/watch?v=VVn9OG9nfH0', 2),
('AJAX and Fetch API Tutorial', 'Make asynchronous web requests in JavaScript.', 'https://www.youtube.com/watch?v=cuEtnrL9-H0', 1),
('Java Collections Framework', 'Detailed overview of Java collections.', 'https://www.youtube.com/watch?v=K1iu1kXkVoA', 1),
('React.js Crash Course', 'Get started with React for frontend.', 'https://www.youtube.com/watch?v=w7ejDZ8SWv8', 3),
('Tailwind CSS Crash Course', 'Style websites using Tailwind.', 'https://www.youtube.com/watch?v=UBOj6rqRUME', 1);

-- ========================================
-- 5. Table: comments
-- ========================================
CREATE TABLE comments (
    comment_id INT AUTO_INCREMENT PRIMARY KEY,
    video_id INT NOT NULL,
    user_id INT NOT NULL,
    content TEXT NOT NULL,
    commented_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (video_id) REFERENCES videos(video_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

INSERT INTO comments (video_id, user_id, content) VALUES
(1, 1, 'Very helpful video! Thanks.'),
(2, 2, 'This made servlets much easier to understand.');

-- ========================================
-- 6. Table: reports
-- ========================================
CREATE TABLE reports (
    report_id INT AUTO_INCREMENT PRIMARY KEY,
    video_id INT NOT NULL,
    user_id INT NOT NULL,
    reason TEXT NOT NULL,
    reported_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (video_id) REFERENCES videos(video_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

INSERT INTO reports (video_id, user_id, reason) VALUES
(3, 1, 'Broken video link'),
(2, 2, 'Inappropriate language in comments');

-- ========================================
-- 7. VIEW: video_details_view
-- ========================================
CREATE VIEW video_details_view AS
SELECT 
    v.video_id,
    v.title,
    v.description,
    v.youtube_url,
    v.uploaded_at,
    a.full_name AS uploaded_by,
    COUNT(c.comment_id) AS total_comments
FROM videos v
LEFT JOIN admins a ON v.uploaded_by = a.admin_id
LEFT JOIN comments c ON v.video_id = c.video_id
GROUP BY v.video_id;

-- ========================================
-- 8. VIEW: comment_details_view
-- ========================================
CREATE VIEW comment_details_view AS
SELECT 
    c.comment_id,
    c.content,
    c.commented_at,
    u.full_name AS commenter,
    v.title AS video_title
FROM comments c
JOIN users u ON c.user_id = u.user_id
JOIN videos v ON c.video_id = v.video_id;

-- ========================================
-- 9. VIEW: report_details_view
-- ========================================
CREATE VIEW report_details_view AS
SELECT 
    r.report_id,
    v.title AS video_title,
    u.full_name AS reported_by,
    r.reason,
    r.reported_at
FROM reports r
JOIN videos v ON r.video_id = v.video_id
JOIN users u ON r.user_id = u.user_id;