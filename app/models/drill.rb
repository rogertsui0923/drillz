class Drill < ApplicationRecord
  belongs_to :user
  belongs_to :drill_group
  has_many :solutions, dependent: :destroy
  has_many :attempts, dependent: :destroy
  has_many :attempted_users, through: :attempts, source: :user

  accepts_nested_attributes_for :solutions, reject_if: :all_blank,
                                         allow_destroy: true

  validates :description, presence: true
end
