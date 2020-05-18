require "test_helper"

describe Work do
  let (:new_work) {
    Work.new(category: "movie", title: "A Beautiful Mind", creator: "Akiva Goldsman", publication_year: "2001" , description: "American biographical drama film based on the life of the American mathematician John Nash.")
  }

  it "can be instantiated" do
    expect(new_work.valid?).must_equal true
  end
end
