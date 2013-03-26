class DropTableTreasuresItems < ActiveRecord::Migration
  def up
    drop_table :treasures_items
  end

  def down
  end
end
