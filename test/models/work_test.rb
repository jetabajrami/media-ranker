require "test_helper"

describe Work do
  before do
    @work = Work.new(title: "A Beautiful Mind", creator: "Akiva Goldsman", publication_year: "2001" , description: "American biographical drama film based on the life of the American mathematician John Nash.")
  end

  it "work can be instantiated" do
    @work.save
    expect(@work.valid?).must_equal true
  end

  it "work will have the required fields" do
    work = works(:work1)

    [:category, :title, :creator, :publication_year, :description].each do |field|
      expect(work).must_respond_to field
    end
  end

  describe "validations" do

    it "it's invalid when work does't have title" do
      work = works(:work1)
      work.title = nil
      expect(work.valid?).must_equal false
      expect(work.errors.messages).must_include :title
      expect(work.errors.messages[:title]).must_equal ["can't be blank"]
    end

    it "it's valid when work has title" do
      work = works(:work1)
      expect(work.valid?).must_equal true
    end

    it "is invalid with a non-unique title in the same category" do
      @work.title = "Blue Breaker"
      @work.category = :movie
      expect(@work.valid?).must_equal false
      expect(@work.errors.messages).must_include :title
      expect(@work.errors.messages[:title]).must_equal ["has already been taken"]
    end

    it "is valide with a uiuqe title in the same category" do
      @work.title = "Shtedler List"
      @work.category = :movie
      expect(@work.valid?).must_equal true
    end

    it "it's invalid when creator doesn't exist" do
      @work.creator = nil
      expect(@work.valid?).must_equal false
      expect(@work.errors.messages).must_include :creator
      expect(@work.errors.messages[:creator]).must_equal ["can't be blank"]
    end

    it "it's valid when creator exist" do
      @work.creator = !nil
      expect(@work.valid?).must_equal true
    end

    # it "must have a publication_year and publication_year should be 4 char" do
    #   new_work.publication_year = nil
    #   expect(new_work.valid?).must_equal false
    #   expect(new_work.errors.messages).must_include :publication_year
    #   expect(new_work.errors.messages[:publication_year]).must_equal ["can't be blank", "is the wrong length (should be 4 characters)"]
    # end

    # it "must have a description" do
    #   new_work.description = nil
    #   expect(new_work.valid?).must_equal false
    #   expect(new_work.errors.messages).must_include :description
    #   expect(new_work.errors.messages[:description]).must_equal ["can't be blank"]
    # end
  end
end


