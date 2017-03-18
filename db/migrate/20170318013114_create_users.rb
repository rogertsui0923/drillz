class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.string :photo
      t.integer :points
      t.integer :donuts
      t.boolean :is_admin
      t.boolean :is_instructor

      t.timestamps
    end
  end
end
