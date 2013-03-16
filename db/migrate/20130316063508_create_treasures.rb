class CreateTreasures < ActiveRecord::Migration
  def change
    create_table :treasures do |t|
      t.text :description
      t.integer :level
      t.integer :quantity
      t.integer :quantity_assigned
      t.references :item

      t.timestamps
    end
    add_index :treasures, :item_id
  end
end
