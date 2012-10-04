require 'spec_helper'

describe UsersController do
	describe "POST create" do
		it "should sign up new user and redirect to root path" do
			post :create, :user => {:email => "test@example.com", :password => "password", :password_confirmation => "password"}
			User.count.should eq(1)
			response.should redirect_to root_path
		end

		it "should not create user and not redirect if email is missing" do
			post :create, :user => {:password => "password", :password_confirmation => "password"}
			User.count.should eq(0)
			response.should_not redirect_to root_path
		end

		it "should not create user and not redirect if password is missing" do
			post :create, :user => {:email => "test@example.com", :password_confirmation => "password"}
			User.count.should eq(0)
			response.should_not redirect_to root_path
		end

		it "should not create user and not redirect if password does not match password confirmation" do
			post :create, :user => {:email => "test@example.com", :password => "password", :password_confirmation => "secret"}
			User.count.should eq(0)
			response.should_not redirect_to root_path
		end

	end

end
