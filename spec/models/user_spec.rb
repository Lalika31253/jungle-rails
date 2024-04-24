require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do

     #validates :password and :password_confirmation
    it 'is not valid when entered password and password confirmation does not match' do
      @user = User.create(first_name: "Rob", last_name: "Dylan", email: "rdylan@email.com", password: 'newpassword', password_confirmation: 'somepassword')
      @user.save
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end


     #validates :first_name and :last_name
    it "first name, and last name should be required" do
      @user = User.create(first_name: "", last_name: "Dylan", email: "rdylan@email.com", password: 'newpassword', password_confirmation: 'newpassword')
      @user.save
      expect(@user.errors.full_messages).to include("First name can't be blank")

      @user = User.create(first_name: "Rob", last_name: "", email: "rdylan@email.com", password: 'newpassword', password_confirmation: 'newpassword')
      @user.save
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end


    it 'is not valid when the email already exists in the DB' do
      User.create(first_name: "Sam", last_name: "Smith", email: "smith@email.com", password: 'something', password_confirmation: 'something')
      @user2 = User.new(first_name: "Rob", last_name: "Dylan", email: "smith@email.com", password: 'lhl2024', password_confirmation: 'lhl2024')
      @user2.save
      expect(@user2.errors.full_messages).to include("Email has already been taken")
    end  

    it 'password should have a minimum 3 characters' do
      @user = User.create(first_name: "Rob", last_name: "Dylan", email: "rdylan@email.com", password: '12', password_confirmation: '12')
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 3 characters)")
    end
  end


  describe '.authenticate_with_credentials' do
  
    it 'should log a user in with valid credentials' do
      @user = User.create(first_name: "Rob", last_name: "Dylan", email: "rdylan@email.com", password: "something", password_confirmation: 'something')
      @user_is_valid = User.authenticate_with_credentials("rdylan@email.com", "something")
      expect(@user_is_valid).to_not equal(nil)
    end

    it 'should log user in with spaces in the email' do
      @user = User.create(first_name: "Rob", last_name: "Dylan", email: "rdylan@email.com", password: "something", password_confirmation: 'something')
      @user_is_valid = User.authenticate_with_credentials(" rdylan@email.com ", "something")
      expect(@user_is_valid).to_not equal(nil)
    end

    it 'should log user in if email is in lower or upper case' do
      @user = User.create(first_name: "Rob", last_name: "Dylan", email: "rdylan@email.com", password: "something", password_confirmation: 'something')
      @user_is_valid = User.authenticate_with_credentials("RDylan@Email.com", "something")
      expect(@user_is_valid).to_not equal(nil)
    end
  end

end

    

