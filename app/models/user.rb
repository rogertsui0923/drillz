class User < ApplicationRecord
  attr_accessor :remember_token, :activation_token, :reset_token
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

  ########################PASSWORD RESET############################################

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
    BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end


  # Activates an account.
    def activate
      update_attribute(:activated,    true)
      update_attribute(:activated_at, Time.zone.now)
    end

    # Sends activation email.
    def send_activation_email
      UsersMailer.account_activation(self).deliver_now
    end

    # Sets the password reset attributes.
    def create_reset_digest
      self.reset_token = User.new_token
      update_attribute(:reset_token,  User.digest(reset_token))
      update_attribute(:reset_sent_at, Time.zone.now)
    end

    # Sends password reset email.
    def send_password_reset_email
      UsersMailer.password_reset(self).deliver_now
    end

  private

  def set_defaults
    self.points ||= 0
    self.donuts ||= 0
    self.is_admin ||= false
    self.is_approved ||= false
  end

  def create_activation_digest
    self.activation_token  = User.new_token
    self.activation_digest = User.digest(activation_token)
  end
end
