class CreateDrillGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :drill_groups do |t|
      t.string :name
      t.text :description
      t.string :level
      t.integer :points

      t.timestamps
    end
  end
end
