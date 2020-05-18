require "test_helper"

describe Work do
  let (:new_work) {
    Work.new(category: "movie", title: "A Beautiful Mind", creator: "Akiva Goldsman", publication_year: "2001" , description: "American biographical drama film based on the life of the American mathematician John Nash.")
  }

  it "work can be instantiated" do
    expect(new_work.valid?).must_equal true
  end

  it "work will have the required fields" do
    new_work.save
    work = Work.first
    [:category, :title, :creator, :publication_year, :description].each do |field|

      expect(work).must_respond_to field
    end
  end
end
