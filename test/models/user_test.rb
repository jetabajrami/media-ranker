require "test_helper"

describe User do
  before do
    @user = User.new(name: "Lak")
  end

  it "user can be instantiated" do
    @user.save
    expect(@user.valid?).must_equal true
  end

  it "user will have the required field" do
    user = users(:lak)

    [:name].each do |field|
      expect(user).must_respond_to field
    end
  end

 
end
