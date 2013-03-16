class AddHeroToTreasure < ActiveRecord::Migration
  def change
    change_table :treasures do |t|
      t.references :hero
    end
    add_index :treasures, :hero_id
  end
end
