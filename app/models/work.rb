class Work < ApplicationRecord
  has_many :votes
  has_many :users, through: :votes

  #validation
  validates :title, presence: true, uniqueness: true
  validates :creator, presence: true
  validates :publication_year, presence: true, length: {is: 4}, uniqueness: true
  validates :description, presence: true

  def self.top_ten(category)
    works = Work.where(category: category).max_by(10) do |work|
      work.votes.count
    end
    return works
  end

  def self.spot_light
    works = Work.all
    return works.first
  end
  
  def self.count_vote(work_id)
    work = Work.find_by(id: work_id)
    votes = Vote.all
    votes_per_work = work.votes.count
    return votes_per_work
  end
end
