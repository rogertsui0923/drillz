class Drill < ApplicationRecord
  belongs_to :user
  belongs_to :drill_group
  has_many :solutions, dependent: :destroy
  has_many :attempts, dependent: :destroy
  has_many :attempted_users, through: :attempts, source: :user

  validates :description, presence: true
end
