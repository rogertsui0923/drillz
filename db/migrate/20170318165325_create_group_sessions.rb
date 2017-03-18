class CreateGroupSessions < ActiveRecord::Migration[5.0]
  def change
    create_table :group_sessions do |t|
      t.references :user, foreign_key: true
      t.references :drill_group, foreign_key: true
      t.integer :points

      t.timestamps
    end
  end
end
