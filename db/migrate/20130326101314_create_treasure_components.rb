class CreateTreasureComponents < ActiveRecord::Migration
  def change
    create_table :treasure_components do |t|
      t.references :treasure
      t.references :item
      t.integer :quantity
      t.integer :quantity_assigned

      t.timestamps
    end
    add_index :treasure_components, :treasure_id
    add_index :treasure_components, :item_id
  end
end
