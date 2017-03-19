class AddDefaults < ActiveRecord::Migration[5.0]
  def change
    change_column :attempts, :success, :boolean, default: false
    change_column :group_sessions, :points, :integer, default: 0
    change_column :users, :points, :integer, default: 0
    change_column :users, :donuts, :integer, default: 0
    change_column :users, :is_admin, :boolean, default: false
  end
end
