class Work < ApplicationRecord
  has_many :votes
  has_many :users, through: :votes

  #validation
  validates :title, presence: true
  validates :title, uniqueness: {scope: :category}
  validates :creator, presence: true
  validates :publication_year, presence: true
  validates :description, presence: true

  def self.top_ten(category)
    works = Work.where(category: category).max_by(10) do |work|
      work.votes.count
    end
    return works
  end

  def self.work_with_max_vote
    work = Work.all.max_by do |work|
      work.votes.count
    end
    return work
  end
  
  def self.category_sort(category)
    works = Work.where(category: category).sort_by do |work|
      work.votes.count
    end
    return works.reverse
  end

  def self.count_vote(work_id)
    work = Work.find_by(id: work_id)
    votes = Vote.all
    votes_per_work = work.votes.count
    return votes_per_work
  end
end
