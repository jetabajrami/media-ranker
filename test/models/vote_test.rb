require "test_helper"

describe Vote do
  before do
    @work1 = works(:work1)
    @lak = users(:lak)
    @vote = Vote.create(work_id: @work1.id, user_id: @lak.id)
  end
  describe "relations" do
    it "vote belongs to one work" do
      expect(@vote.work).must_be_instance_of Work
      expect(@vote.work).must_equal @work1
    end
    it "vote belongs to one user" do
      expect(@vote.user).must_be_instance_of User
      expect(@vote.user).must_equal @lak
    end 
  end
end
