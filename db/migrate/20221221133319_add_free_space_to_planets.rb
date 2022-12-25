class AddFreeSpaceToPlanets < ActiveRecord::Migration[7.0]
  def change
    add_column :planets, :free_space, :integer, null: false, default: 100
  end
end
