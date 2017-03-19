class AddBodyToAttempts < ActiveRecord::Migration[5.0]
  def change
    add_column :attempts, :body, :text
  end
end
