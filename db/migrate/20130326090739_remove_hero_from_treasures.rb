class RemoveHeroFromTreasures < ActiveRecord::Migration
  def up
     remove_column :treasures, :hero
  end
  def down
     add_column :treasures, :hero, :references
  end
end
