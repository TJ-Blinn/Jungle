require 'rails_helper'

RSpec.describe User, type: :model do
  # set up fake user for each test below
  subject {User.new(first_name: "Joe", last_name: "Black", email: "joe.b@hotmail.com", password: "password", password_confirmation: "password")}
  
  describe 'Validate Passwords' do 
    it "should not be valid if password does not match password confirmation" do 
      # user = User.new 
      # user.first_name = "Joe"
      # user.last_name = "Black"
      # user.email = "joe.b@hotmail.com"
      # user.password = "password"
      # user.password_confirmation = "no"
      subject.password_confirmation = "asdfasfsg"

      expect(subject).not_to be_valid      
      expect(subject.errors.full_messages).to include("Password confirmation doesn't match Password")
      # puts user.errors.full_messages 
    end 

    it "Should be valid if password matches password confirmation" do 
      user = User.new 
      user.first_name = "Joe"
      user.last_name = "Black"
      user.email = "joe.b@hotmail.com"
      user.password = "password"
      user.password_confirmation = "password"

      expect(user).to be_valid
      expect(user.errors.full_messages).to eql([])
      # puts user.errors.full_messages 
    end 
    
  end

  describe 'authenticate_with_credentials' do
    it "Returns user if user exists" do 
      #the test db will now have the subject fake user in order to compare the user in db
      subject.save 
      # user.email = "JOE.B@HOTMAIL.COM"
      # user.password = "password"
      # user.password_confirmation = "password"
      fake = User.authenticate_with_credentials("joe.b@hotmail.com", "password")
      expect(fake).not_to be_nil
    end 

    it "Returns Nil if user does not exists" do
      #the test db will now have the subject fake user in order to compare the user in db
      subject.save 
    # user.email = "JOE.B@HOTMAIL.COM"
    # user.password = "password"
    # user.password_confirmation = "password"
    fake = User.authenticate_with_credentials("joe.b@hotmail.com", "pwd")
    expect(fake).to be_nil     
    end

    it "returns user even if trailing spaces present" do      
      subject.save 
    
    fake = User.authenticate_with_credentials(" joe.b@hotmail.com ", "password")
    expect(fake).not_to be_nil    
    end

    it "returns user even if casing ranges small to large" do      
      subject.save 
    
    fake = User.authenticate_with_credentials("JoE.b@hOTmail.com", "password")
    expect(fake).not_to be_nil    
    end

  end 

end

