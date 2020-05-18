require "test_helper"

describe UsersController do
  it "can get the login form" do
   get login_path
   must_respond_with :success
  end

  describe "loggin in" do
    it "can log in new user" do
      user = nil
 
      expect{user = login()}.must_differ "User.count", 1

      must_respond_with :redirect
      
      expect(user).wont_be_nil
      expect(session[:user_id]).must_equal user.id
      expect(user.name).must_equal user_hash[:user][:name]
    end

    it "can log an existing user" do
      user = User.create(name: "Flutura")
      expect{login(user.name)}.wont_change "User.count"

      expect(session[:user_id]).must_equal user.id
    end
  end

end
