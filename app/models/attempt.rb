class Attempt < ApplicationRecord
  belongs_to :user
  belongs_to :drill

  validates :drill_id, presence: true
  validates :user_id, presence: true
  validates :drill_id, uniqueness: { scope: :user_id }
  validates :num_attempts, presence: true

  after_initialize(:set_num_attempts)

  private

  def set_num_attempts
    self.num_attempts ||= 0
  end

end
