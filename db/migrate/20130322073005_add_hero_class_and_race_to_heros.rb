class AddHeroClassAndRaceToHeros < ActiveRecord::Migration
  def change
    add_column :heros, :hero_class, :string
    add_column :heros, :race, :string
  end
end
