class Work < ApplicationRecord
  has_many :votes
  has_many :users, through: :votes

  #validation
  validates :title, presence: true, uniqueness: true
  validates :creator, presence: true
  validates :publication_year, presence: true, length: {is: 4}, uniqueness: true
  validates :description, presence: true

  def self.top_ten(category)
    works = Work.where(category: category)
    return works.limit(10)
  end

  def self.spot_light
    works = Work.all
    return works.first
  end

end
