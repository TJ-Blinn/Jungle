# app/models/user.rb This is the line of code that gives our User model authentication methods via bcrypt.
    
class User < ActiveRecord::Base

  has_secure_password

end