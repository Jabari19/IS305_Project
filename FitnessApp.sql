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
    age INT(3) NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Login Log Table
CREATE TABLE login_log (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    login_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    logout_time TIMESTAMP NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE
);

-- Exercises Table
CREATE TABLE Exercises (
    exercise_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    category VARCHAR(50)
);

-- Workouts Table
CREATE TABLE Workouts (
    workout_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    date DATETIME NOT NULL,
    duration INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE
);

-- Workout_Exercises Table
CREATE TABLE Workout_Exercises (
    workout_exercise_id INT AUTO_INCREMENT PRIMARY KEY,
    workout_id INT NOT NULL,
    exercise_id INT NOT NULL,
    sets INT,
    reps INT,
    FOREIGN KEY (workout_id) REFERENCES Workouts(workout_id) ON DELETE CASCADE,
    FOREIGN KEY (exercise_id) REFERENCES Exercises(exercise_id) ON DELETE CASCADE
);

-- Nutrition Table
CREATE TABLE Nutrition (
    nutrition_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    meal VARCHAR(100) NOT NULL,
    calories INT NOT NULL,
    protein INT NOT NULL,
    fat INT NOT NULL,
    carbs INT NOT NULL,
    date DATETIME NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE
);

-- Equipment Table
CREATE TABLE Equipment (
    equipment_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    type VARCHAR(50)
);

-- Goals Table
CREATE TABLE Goals (
    goal_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    goal_description TEXT NOT NULL,
    target_date DATE NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE
);

-- Trainers Table
CREATE TABLE Trainers (
    trainer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    certification VARCHAR(100) NOT NULL
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
INSERT INTO Users (first_name, last_name, email, password, role, age) VALUES 
('Alice', 'Smith', 'alice@yahoo.com', '$2y$10$...hash...', 'user', 28),
('Bob', 'Johnson', 'bob@gmail.com', '$2y$10$...hash...', 'user', 32),
('Charlie', 'Brown', 'charlie@gmail.com', '$2y$10$...hash...', 'user', 25),
('Admin', 'User', 'admin@yahoo.com', '$2y$10$...hash...', 'admin', 40);

-- Insert login logs
INSERT INTO login_log (user_id, login_time, logout_time) VALUES
(1, '2024-12-01 08:00:00', '2024-12-01 08:30:00'),
(2, '2024-12-01 09:00:00', '2024-12-01 09:45:00'),
(3, '2024-12-01 10:00:00', '2024-12-01 10:30:00');

-- Insert exercises
INSERT INTO Exercises (name, description, category) VALUES
('Push Up', 'A basic strength exercise targeting the chest.', 'Strength'),
('Running', 'A cardio exercise involving running.', 'Cardio'),
('Squat', 'A lower body strength exercise.', 'Strength');

-- Insert workouts
INSERT INTO Workouts (user_id, date, duration) VALUES
(1, '2024-12-01 08:00:00', 30),
(2, '2024-12-01 09:00:00', 45);

-- Insert workout exercises
INSERT INTO Workout_Exercises (workout_id, exercise_id, sets, reps) VALUES 
(1, 1, 3, 10),
(2, 2, 4, 15);

-- Insert nutrition records
INSERT INTO Nutrition (user_id, meal, calories, protein, fat, carbs, date) VALUES
(1, 'Chicken Salad', 400, 30, 15, 35, '2024-12-01 12:00:00');

-- Insert trainers
INSERT INTO Trainers (first_name, last_name, certification) VALUES
('John', 'Henry', 'Certified Personal Trainer');

-- Insert activity logs
INSERT INTO ActivityLog (user_id, action, details) VALUES 
(1, 'Logged in', 'Accessed dashboard');
