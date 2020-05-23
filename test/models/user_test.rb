require "test_helper"

describe User do
  before do
    @user = User.new(name: "Lak")
    @lak = users(:lak)
    @work1 = works(:work1)
    @work2 = works(:work2)
    @work3 = works(:work3)
  end

  it "user can be instantiated" do
    @user.save
    expect(@user.valid?).must_equal true
  end

  it "user will have the required field" do
    [:name].each do |field|
      expect(@lak).must_respond_to field
    end
  end

  describe "relations" do
    it "user can have many votes" do
      expect {
        Vote.create!(work_id: @work1.id, user_id: @lak.id)
        Vote.create!(work_id: @work2.id, user_id: @lak.id)
        Vote.create!(work_id: @work3.id, user_id: @lak.id)
      }.must_differ "@lak.votes.count", 3
    end

    it "user can have many works through votes" do
      Vote.create!(work_id: @work1.id, user_id: @lak.id)
      Vote.create!(work_id: @work2.id, user_id: @lak.id)

      vote_nr = 0
      @lak.votes.each do |vote|
        works = Work.find_by(id: vote.work_id)
        expect(works).must_be_instance_of Work
      end
    end
  end

  describe "validations" do
    it "it's invalid when user does't have name" do
 
      @lak.name = nil
      expect(@lak.valid?).must_equal false
      expect(@lak.errors.messages).must_include :name
      expect(@lak.errors.messages[:name]).must_equal ["can't be blank"]
    end

    it "it's valid when user has name" do
      @lak.name = "lak"
      expect(@lak.valid?).must_equal true
    end


    it "is invalid with a non-unique name" do
      @user.name = "lak"

      expect(@user.valid?).must_equal false
      expect(@user.errors.messages).must_include :name
      expect(@user.errors.messages[:name]).must_equal ["has already been taken"]
    end
  end
end
