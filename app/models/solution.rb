class Solution < ApplicationRecord
  belongs_to :drill

  validates :body, presence: true
end
