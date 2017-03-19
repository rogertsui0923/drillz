class User < ApplicationRecord
  has_secure_password

  has_many :favourites, dependent: :destroy
  has_many :favourite_drill_groups, through: :favourites, source: :drill_group
  has_many :attempts, dependent: :destroy
  has_many :attempted_drills, through: :attempts, source: :drill
  has_many :group_sessions, dependent: :destroy

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true, format: VALID_EMAIL_REGEX
  validates :password_digest, presence: true
  validates :points, presence: true
  validates :donuts, presence: true

  after_initialize(:set_defaults)

  private


  def set_defaults
    self.points ||= 0
    self.donuts ||= 0
    self.is_admin ||= false
    self.is_approved ||= false
  end
end
