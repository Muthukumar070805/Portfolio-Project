-- Create the database
CREATE DATABASE IF NOT EXISTS Portfolio;
USE Portfolio;

-- Users table (main profile information)
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    image VARCHAR(255),
    description TEXT,
    role VARCHAR(100),
    email VARCHAR(100) NOT NULL,
    phone VARCHAR(20),
    instagram VARCHAR(255),
    facebook VARCHAR(255),
    twitter VARCHAR(255)
);

-- Work experience table
CREATE TABLE work (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    period VARCHAR(100) NOT NULL,
    role VARCHAR(100) NOT NULL,
    company VARCHAR(100) NOT NULL,
    description TEXT,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Education table
CREATE TABLE education (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    period VARCHAR(100) NOT NULL,
    degree VARCHAR(100) NOT NULL,
    institution VARCHAR(100) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Skills table
CREATE TABLE skills (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Projects table
CREATE TABLE projects (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    image VARCHAR(255),
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Insert user data with all fields
INSERT INTO users (
    name, image, description, role, 
    email, phone, instagram, github, twitter
) VALUES (
    'Muthu Kumar M',
    '/assets/profile_photo.png',
    'Mechanical Engineering student with interests in programming, AI, and Backend web-development',
    'Backend Developer',
    'muthukumar.official07@gmail.com',
    '+91 755-- -----',
    'https://www.instagram.com/_piratehunter_21/',
    'https://github.com/Muthukumar070805',
    'https://x.com/MuthuKumar11266'
);

-- Insert education data
INSERT INTO education (
    user_id, period, degree, institution
) VALUES 
(1, 'Sept 2023 - May 2027', 'B.E. in Mechanical Engineering', 'Sri Sairam Institute of Technology'),
(1, 'June 2016 - May 2023', '10th and 12th Standard', 'Immanuel Matriculation Higher Secondary School');

-- Insert skills (fixed syntax - each skill on separate row)
INSERT INTO skills (
    user_id, name
) VALUES 
(1, 'C, Python'),
(1, 'HTML, CSS, JavaScript'),
(1, 'Node.JS, Express, MySQL'),
(1, 'AutoCAD, SolidWorks'),
(1, 'TensorFlow, pandas, NumPy');

-- Insert projects with image URLs
INSERT INTO projects (
    user_id, name, description, image
) VALUES 
(1, 'Smart Priority ToDo Tracker', 
 'A priority-based ToDo app built with pure HTML, CSS, and JavaScript—featuring dynamic task sorting, color-coded priorities, and real-time Done tracking with timestamps. Tasks persist via localStorage, with intuitive controls like checkboxes, delete, and clear history. Fully framework-free, this project highlights clean DOM manipulation, event-driven logic, and UI clarity tailored for task management efficiency.',
 'assets/Screenshot 2025-04-05 162856.png'),
 
(1, 'Dog vs Cat Classifier', 
 'A convolution neural network (CNN) model for classifying images as either cats or dogs. This project uses a CNN built with Keras to distinguish between cat and dog images, trained on a labeled dataset.',
 'assets/Gemini_Generated_Image_r7pvtur7pvtur7pv.png'),
 
(1, 'House Price Prediction Model', 
 'A linear regression model for predicting house price using selected features from the House Price - Advanced regression Techniques dataset from Kaggle.',
 'assets/Gemini_Generated_Image_3v17s23v17s23v17.png');

INSERT INTO work (
    user_id, 
    company, 
    role, 
    period, 
    description
) VALUES (
    1,  -- Your user_id
    'Preci-Com CNC', 
    'Machine Operator Intern', 
    'June 14 - July 1', 
    'Gained hands-on experience operating CNC machinery, assisting with precision part production. Learned machine setup, quality control procedures, and basic maintenance. Developed technical skills in computer-controlled manufacturing while working under senior operators.'
);