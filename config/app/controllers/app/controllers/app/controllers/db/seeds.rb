# db/seeds.rb

# Users
users = [
  { first_name: 'Alice', last_name: 'Smith', email: 'alice@yahoo.com', password: 'password_hash', role: 'user', age: 28 },
  { first_name: 'Bob', last_name: 'Johnson', email: 'bob@gmail.com', password: 'password_hash', role: 'user', age: 32 },
  { first_name: 'Charlie', last_name: 'Brown', email: 'charlie@gmail.com', password: 'password_hash', role: 'user', age: 25 },
  { first_name: 'Admin', last_name: 'User', email: 'admin@yahoo.com', password: 'password_hash', role: 'admin', age: 40 }
]

users.each do |user|
  User.create(user)
end

# Login logs
LoginLog.create(user_id: 1, login_time: '2024-12-01 08:00:00', logout_time: '2024-12-01 08:30:00')
LoginLog.create(user_id: 2, login_time: '2024-12-01 09:00:00', logout_time: '2024-12-01 09:45:00')
LoginLog.create(user_id: 3, login_time: '2024-12-01 10:00:00', logout_time: '2024-12-01 10:30:00')

# Exercises
Exercise.create(name: 'Push Up', description: 'A basic strength exercise targeting the chest.', category: 'Strength')
Exercise.create(name: 'Running', description: 'A cardio exercise involving running.', category: 'Cardio')
Exercise.create(name: 'Squat', description: 'A lower body strength exercise.', category: 'Strength')

# Workouts
Workout.create(user_id: 1, date: '2024-12-01 08:00:00', duration: 30)
Workout.create(user_id: 2, date: '2024-12-01 09:00:00', duration: 45)

# Workout_Exercises
WorkoutExercise.create(workout_id: 1, exercise_id: 1, sets: 3, reps: 10)
WorkoutExercise.create(workout_id: 2, exercise_id: 2, sets: 4, reps: 15)

# Nutrition
Nutrition.create(user_id: 1, meal: 'Chicken Salad', calories: 400, protein: 30, fat: 15, carbs: 35, date: '2024-12-01 12:00:00')

# Trainers
Trainer.create(first_name: 'John', last_name: 'Henry', certification: 'Certified Personal Trainer')

# ActivityLog
ActivityLog.create(user_id: 1, action: 'Logged in', details: 'Accessed dashboard')
