# app/models/login_log.rb
class LoginLog < ApplicationRecord
  belongs_to :user
end
