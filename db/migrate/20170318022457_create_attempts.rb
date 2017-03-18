class CreateAttempts < ActiveRecord::Migration[5.0]
  def change
    create_table :attempts do |t|
      t.references :user, foreign_key: true
      t.references :drill, foreign_key: true
      t.integer :num_attempts
      t.boolean :success

      t.timestamps
    end
  end
end
