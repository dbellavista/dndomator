class AddPacketToTreasure < ActiveRecord::Migration
  def change
    add_column :treasures, :packet, :integer
  end
end
