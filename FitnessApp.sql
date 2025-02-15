-- Drop the database if it exists and recreate it
DROP DATABASE IF EXISTS WorkoutDB;
CREATE DATABASE WorkoutDB;
USE WorkoutDB;

-- Users Table
CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    role ENUM('user', 'admin') NOT NULL DEFAULT 'user',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Login Log Table
CREATE TABLE login_log (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    login_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    logout_time TIMESTAMP NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- Exercises Table
CREATE TABLE Exercises (
    exercise_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    description TEXT,
    category VARCHAR(50)
);

-- Workouts Table
CREATE TABLE Workouts (
    workout_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    date DATETIME,
    duration INT,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- Workout_Exercises Table
CREATE TABLE Workout_Exercises (
    workout_exercise_id INT AUTO_INCREMENT PRIMARY KEY,
    workout_id INT,
    exercise_id INT,
    sets INT,
    reps INT,
    FOREIGN KEY (workout_id) REFERENCES Workouts(workout_id),
    FOREIGN KEY (exercise_id) REFERENCES Exercises(exercise_id)
);

-- Nutrition Table
CREATE TABLE Nutrition (
    nutrition_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    meal VARCHAR(100),
    calories INT,
    protein INT,
    fat INT,
    carbs INT,
    date DATETIME,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- Equipment Table
CREATE TABLE Equipment (
    equipment_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    description TEXT,
    type VARCHAR(50)
);

-- Goals Table
CREATE TABLE Goals (
    goal_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    goal_description TEXT,
    target_date DATE,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- Trainers Table
CREATE TABLE Trainers (
    trainer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    certification VARCHAR(100)
);

-- ActivityLog Table
CREATE TABLE ActivityLog (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    action VARCHAR(255) NOT NULL,
    timestamp DATETIME DEFAULT CURRENT_TIMESTAMP,
    details TEXT,
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE
);

-- Insert users
INSERT INTO Users (first_name, last_name, email, password, role) VALUES 
('Alice', 'Smith', 'alice@yahoo.com', '$2y$10$...hash...', 'user'),
('Bob', 'Johnson', 'bob@gmail.com', '$2y$10$...hash...', 'user'),
('Charlie', 'Brown', 'charlie@gmail.com', '$2y$10$...hash...', 'user'),
('Admin', 'User', 'admin@yahoo.com', '$2y$10$...hash...', 'admin');

-- Insert  login logs
INSERT INTO login_log (user_id, login_time, logout_time) VALUES
(1, '2024-12-01 08:00:00', '2024-12-01 08:30:00'),
(2, '2024-12-01 09:00:00', '2024-12-01 09:45:00'),
(3, '2024-12-01 10:00:00', '2024-12-01 10:30:00'),
(1, '2024-12-02 08:15:00', '2024-12-02 08:45:00');

-- Insert exercises
INSERT INTO Exercises (name, description, category) VALUES
('Push Up', 'A basic strength exercise targeting the chest.', 'Strength'),
('Running', 'A cardio exercise involving running.', 'Cardio'),
('Squat', 'A lower body strength exercise.', 'Strength'),
('Plank', 'A core stability exercise.', 'Core');

-- Insert workouts
INSERT INTO Workouts (user_id, date, duration) VALUES
(1, '2024-12-01 08:00:00', 30),
(2, '2024-12-01 09:00:00', 45),
(3, '2024-12-01 10:00:00', 60),
(1, '2024-12-02 08:30:00', 50);

-- Insert  workout exercises
INSERT INTO Workout_Exercises (workout_id, exercise_id, sets, reps) VALUES 
(1, 1, 3, 10),
(1, 2, 2, 15),
(2, 3, 4, 12),
(3, 4, 5, 30);

-- Insert nutrition records
INSERT INTO Nutrition (user_id, meal, calories, protein, fat, carbs, date) VALUES
(1, 'Chicken Salad', 400, 30, 15, 35, '2024-12-01 12:00:00'),
(2, 'Protein Shake', 250, 20, 5, 30, '2024-12-01 08:30:00'),
(3, 'Grilled Fish', 350, 25, 10, 40, '2024-12-01 13:00:00'),
(1, 'Oatmeal', 200, 8, 3, 36, '2024-12-02 07:00:00');

-- Insert equipment
INSERT INTO Equipment (name, description, type) VALUES 
('Dumbbell', 'Weight lifting equipment', 'Strength'),
('Treadmill', 'Cardio equipment for running indoors', 'Cardio'),
('Yoga Mat', 'A mat used for yoga and stretching.', 'Flexibility'),
('Barbell', 'A long bar used in weightlifting.', 'Strength');

-- Insert goals
INSERT INTO Goals (user_id, goal_description, target_date) VALUES 
(1, 'Lose 10 pounds', '2024-12-31'),
(2, 'Run a marathon', '2024-11-15'),
(3, 'Bench press 200 lbs', '2025-01-15'),
(1, 'Improve flexibility with daily yoga', '2025-02-01');

-- Insert trainers
INSERT INTO Trainers (first_name, last_name, certification) VALUES
('John', 'Henry', 'Certified Personal Trainer'),
('Jane', 'Kamala', 'Certified Strength and Conditioning Specialist'),
('Mark', 'Taylor', 'Certified Nutrition Specialist'),
('Emily', 'Williams', 'Certified Group Fitness Instructor');

-- Insert activity logs
INSERT INTO ActivityLog (user_id, action, details) VALUES 
(1, 'Logged in', 'Accessed dashboard'),
(2, 'Logged in', 'Viewed workout log'),
(3, 'Logged in', 'Started new workout session'),
(1, 'Updated goal', 'Modified target weight loss goal');


SELECT * FROM Users WHERE email = 'admin@yahoo.com';

UPDATE Users
SET password = 'admin123'
WHERE email = 'admin@yahoo.com';
SELECT * FROM Users WHERE email = 'admin@yahoo.com' AND role = 'admin';

ALTER TABLE users ADD COLUMN age INT(3);

INSERT INTO users (first_name, last_name, email, password) 
VALUES ('John', 'Doe', 'john@yahoo.com', 'hashed_password');
