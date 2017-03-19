class AddIsApprovedToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :is_approved, :boolean, default: false
  end
end
