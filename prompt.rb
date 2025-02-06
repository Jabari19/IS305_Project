puts "What is your name?"
name = gets.chomp
puts "Welcome , #{name}!"

# gender
puts "What is your Gender? (m/f)"
gender = gets.chomp.downcase
# male or female addressing
salutation = gender == "m" ? "Sir" : "Ma'am"

#  age
puts "How old are you?"
age = gets.chomp.to_i
# Acknowledge their age
puts "#{salutation}, you are #{age} years old and welcome to our company!"

# if he can drive
puts "Can you drive? (yes/no)"
can_drive = gets.chomp.downcase
driving_status = can_drive == "yes" ? "Can drive" : "Cannot drive"

# Check if he can drive
if can_drive == "yes"
  puts "Great! You can get a Tesla. See you tomorrow!"
else
  puts "Oh no, you can't drive. Maybe next time!"
end