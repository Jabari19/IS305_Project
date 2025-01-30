DROP DATABASE IF EXISTS Fitness_Tracker;

-- Create the database
CREATE DATABASE Fitness_Tracker;

-- Use the newly created database
USE Fitness_Tracker;

-- Create Users table
CREATE TABLE Users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100) UNIQUE,
    age INT
);

-- Create Exercises table
CREATE TABLE Exercises (
    exercise_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    description TEXT,
    category VARCHAR(50)
);

-- Create Workouts table
CREATE TABLE Workouts (
    workout_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    date DATETIME,
    duration INT,
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE
);
