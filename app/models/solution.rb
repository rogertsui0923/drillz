class Solution < ApplicationRecord
  belongs_to :drill
  belongs_to :user

  validates :body, presence: true
end
