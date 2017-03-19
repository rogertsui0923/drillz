class DrillGroup < ApplicationRecord
  has_many :drills, dependent: :destroy
  has_many :favourites, dependent: :destroy
  has_many :favourited_users, through: :favourites, source: :user

  # accepts_nested_attributes_for :drills, reject_if: :all_blank,
  #                                        allow_destroy: true

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :level, presence: true
  validates :points, presence: true

  def find_favourite_by_user(user)
    favourites.find_by(user: user)
  end

end
