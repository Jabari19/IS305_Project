# app/models/user.rb
class User < ApplicationRecord
  has_many :login_logs
  has_many :workouts
  has_many :nutritions
  has_many :goals
  has_many :activity_logs
end
