class GroupSession < ApplicationRecord
  belongs_to :user
  belongs_to :drill_group
  has_many :attempts, dependent: :destroy
  has_many :attempted_drills, through: :attempts, source: :drill
end
