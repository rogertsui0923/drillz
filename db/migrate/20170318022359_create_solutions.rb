class CreateSolutions < ActiveRecord::Migration[5.0]
  def change
    create_table :solutions do |t|
      t.text :body
      t.references :drill, foreign_key: true

      t.timestamps
    end
  end
end
