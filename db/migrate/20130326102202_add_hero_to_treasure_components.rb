class AddHeroToTreasureComponents < ActiveRecord::Migration
  def change
    change_table :treasure_components do |t|
      t.references :hero
    end
  end
end
