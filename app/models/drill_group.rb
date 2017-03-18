class DrillGroup < ApplicationRecord
  has_many :drills, dependent: :destroy
  has_many :favourites, dependent: :destroy
  has_many :favourited_users, through: :favourites, source: :user

  # validates :name, presence: true, uniqueness: true
  # validates :description, presence: true
  # validates :level, presence: true
  # validates :points, presence: true
end
