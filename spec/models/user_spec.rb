require 'rails_helper'

RSpec.describe User, type: :model do
  describe "user validations" do
    it "should create a user if all validations are true" do
      @user = User.create(first: "some", last: "name", email: "test@example.com", password: "password", password_confirmation: "password")
      expect(@user).to be_valid
    end

    it "should not create a user if password and password_confirmation do not match" do
      @user = User.create(first: "some", last: "name", email: "test@example.com", password: "password", password_confirmation: "password1")
      expect(@user).to_not be_valid
    end

    it "should not create a user if email is not unique (case included)" do
      @user1 = User.create(first: "some", last: "name", email: "test@example.com", password: "password", password_confirmation: "password")
      @user2 = User.create(first: "some", last: "name", email: "TEST@EXAMPLE.com", password: "password", password_confirmation: "password")
      expect(@user2).to_not be_valid
    end

    it "should not create a user if first name is not provided" do
      @user = User.create(last: "name", email: "test@example.com", password: "password", password_confirmation: "password")
      expect(@user).to_not be_valid
    end

    it "should not create a user if last name is not provided" do
      @user = User.create(first: "some", email: "test@example.com", password: "password", password_confirmation: "password")
      expect(@user).to_not be_valid
    end

    it "should not create a user if email is not provided" do
      @user = User.create(first: "some", last: "name", password: "password", password_confirmation: "password")
      expect(@user).to_not be_valid
    end

    it "should not create a user if password is not provided" do
      @user = User.create(first: "some", last: "name", email: "test@example.com", password_confirmation: "password")
      expect(@user).to_not be_valid
    end

    it "should not create a user if password_confirmation is not provided" do
      @user = User.create(first: "some", last: "name", email: "test@example.com", password: "password")
      expect(@user).to_not be_valid
    end

    it "should not create a user if password is less than 8 characters" do
      @user = User.create(first: "some", last: "name", email: "test@example.com", password: "pass", password_confirmation: "pass")
      expect(@user).to_not be_valid
    end

    it "should not create a user if email is invalid" do
      @user = User.create(first: "some", last: "name", email: "testexample.com", password: "password", password_confirmation: "password")
      expect(@user).to_not be_valid
    end
  end

  describe ".authenticate_with_credentials" do
    
  end
end
