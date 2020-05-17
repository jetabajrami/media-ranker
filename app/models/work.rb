class Work < ApplicationRecord
  has_many :votes
  has_many :users, through: :votes

  def self.top_ten(category)
    works = Work.where(category: category)
    return works.limit(10)
  end

  def self.spot_light
    works = Work.all
    return works.first
  end

end
