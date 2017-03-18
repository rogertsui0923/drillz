class Attempt < ApplicationRecord
  belongs_to :user
  belongs_to :drill
  belongs_to :group_session

end
