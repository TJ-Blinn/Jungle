# app/models/user.rb This is the line of code that gives our User model authentication methods via bcrypt.
    
class User < ActiveRecord::Base

  has_secure_password  

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }

  # uniqueness validation to avoid any email duplicates disabling case sensitivity
  validates :password, presence: true, length: { minimum: 2 } 
  validates :password_confirmation, presence: true, length: { minimum: 2 } 

  # validates_format_of :email, with: URI::MailTo::EMAIL_REGEXP
  # basic email regex
  # VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  # act on the instance of the User class that we are currently calling
  def self.authenticate_with_credentials(email, password)
    # ActiveRecord query - passing a db query to grab user that matches this email
    # SQL Injection | email comes from user input, so we "sanitize" it with the ?
    stripped = email.strip.downcase
    @user = self.where("email = ?", stripped).first

    # checking that email is valid, and checking that password provided matches pwd in database
    if @user && @user.authenticate(password)
      return @user
    end 
    nil
  end 
end