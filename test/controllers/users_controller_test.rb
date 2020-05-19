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
      expect(user.name).must_equal "Tina"
    end

    it "can log an existing user" do
      user = User.create(name: "Tina")
      expect{login(user.name)}.wont_change "User.count"

      expect(session[:user_id]).must_equal user.id
    end
  end

  describe "loggout" do
    it "can logout a loged in user" do
      #Arrange
      login()
      expect(session[:user_id]).wont_be_nil
      post logout_path
      expect(session[:user_id]).must_be_nil
    end
  end

  describe "current user" do
    it "can retun the page if the user is logged in" do
     login()
     get current_user_path
     must_respond_with :success
    end
    it "redirect us back if the user is logged in" do
     get current_user_path
     must_respond_with :redirect
     expect flash[:error].must_equal "You must be logged in to view this page"
    end
  end



end
