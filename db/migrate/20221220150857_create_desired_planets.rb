class CreateDesiredPlanets < ActiveRecord::Migration[7.0]
  def change
    create_table :desired_planets do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :planet, foreign_key: true

      t.timestamps
    end
  end
end
