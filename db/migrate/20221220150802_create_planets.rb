class CreatePlanets < ActiveRecord::Migration[7.0]
  def change
    create_table :planets do |t|
      t.string :planet_name
      t.string :nearest_star_name
      t.integer :distance_in_ly
      t.text :description

      t.timestamps
    end
  end
end
