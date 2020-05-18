require "test_helper"

describe Work do
  let (:new_work) {
    Work.new(category: "movie", title: "A Beautiful Mind", creator: "Akiva Goldsman", publication_year: "2001" , description: "American biographical drama film based on the life of the American mathematician John Nash.")
  }

  # it "work can be instantiated" do
  #   work = works(:work1)
  #   work.save
  #   expect(work.valid?).must_equal true
  # end

  it "work will have the required fields" do
    
    new_work.save
    work = Work.first
    [:category, :title, :creator, :publication_year, :description].each do |field|

      expect(work).must_respond_to field
    end
  end

  describe "validations" do
    # it "must have a category" do
    #   new_work.category = "movie"

    #   expect(new_work.valid?).must_equal true
    #   expect(new_work.errors.messages).must_include :category
    #   expect(new_work.errors.messages[:category]).must_equal ["can't be blank"]
    # end

    it "must have a title" do
      work = works(:work1)
      work.save
      work.title = nil
      expect(new_work.valid?).must_equal false
      expect(new_work.errors.messages).must_include :title
      expect(new_work.errors.messages[:title]).must_equal ["can't be blank"]
    end

    it "must have a creator" do
      new_work.creator = nil
      expect(new_work.valid?).must_equal false
      expect(new_work.errors.messages).must_include :creator
      expect(new_work.errors.messages[:creator]).must_equal ["can't be blank"]
    end

    it "must have a publication_year and publication_year should be 4 char" do
      new_work.publication_year = nil
      expect(new_work.valid?).must_equal false
      expect(new_work.errors.messages).must_include :publication_year
      expect(new_work.errors.messages[:publication_year]).must_equal ["can't be blank", "is the wrong length (should be 4 characters)"]
    end

    it "must have a description" do
      new_work.description = nil
      expect(new_work.valid?).must_equal false
      expect(new_work.errors.messages).must_include :description
      expect(new_work.errors.messages[:description]).must_equal ["can't be blank"]
    end
  end
end


