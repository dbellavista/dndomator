class AddActiveToHeroes < ActiveRecord::Migration
  def change
    add_column :heros, :active, :boolean
  end
end
