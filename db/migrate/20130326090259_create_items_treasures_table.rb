class CreateItemsTreasuresTable < ActiveRecord::Migration
  def change
    create_table :treasures_items do |t|
      t.references :treasure
      t.references :item
    end
    add_index :treasures_items, [:treasure_id, :item_id]
  end
end
