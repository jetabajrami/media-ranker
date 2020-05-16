class Vote < ApplicationRecord
  belongs_to :works
  belongs_to :user
end

