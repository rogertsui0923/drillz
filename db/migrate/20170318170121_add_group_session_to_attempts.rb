class AddGroupSessionToAttempts < ActiveRecord::Migration[5.0]
  def change
    add_reference :attempts, :group_session, foreign_key: true
  end
end
