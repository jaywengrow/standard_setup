require 'spec_helper'

describe User do
  context "Validations" do

  	it "should invalidate if email is missing" do
  		user = User.new(:password => "password", :password_confirmation => "password")
  		user.should_not be_valid
  	end

  	it "should invalidate if password is missing" do
  		user = User.new(:email => "test@example.com", :password_confirmation => "password")
  		user.should_not be_valid
  	end

  	it "should invalidate if password and password confirmation do not match" do
  		user = User.new(:email => "test@example.com", :password => "password", :password_confirmation => "secret")
  		user.should_not be_valid
  	end

  	it "should invalidate duplicate emails" do
  		old_user = User.new(:email => "test@example.com")
 			old_user.password = "password"
 			old_user.save
  		new_user = User.new(:email => "test@example.com")
  		new_user.password = "other_password"
  		new_user.should_not be_valid
  	end


  end
end
