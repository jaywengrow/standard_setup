require 'spec_helper'

describe SessionsController do

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end

  describe "POST create" do
    before(:each) do
      @user = User.create!(:email => "sally@test.com", :password => "password")
    end
    it "should log in users" do
      post :create, :email => 'sally@test.com', :password => "password"
      response.should redirect_to(root_path)
      session[:user_id].should eq(@user.id)
    end

    it "should not log in user if password is incorrect" do
			post :create, :email => 'sally@test.com', :password => "secret"
      response.should_not redirect_to(root_path)
      flash[:alert].should == "Invalid email or password"
    end
  end

  describe "DELETE destroy" do
  	before(:each) do
      @user = User.create!(:email => "sally@test.com", :password => "password")
    end

    it "should log out user" do
    	delete :destroy
    	session[:user_id].should be_nil
    end
  end
end
