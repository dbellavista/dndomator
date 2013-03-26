class RemoveGarbageFromTreasures < ActiveRecord::Migration
  def change
    remove_column :treasures, :quantity, :quantity_assigned, :packet
  end
end
