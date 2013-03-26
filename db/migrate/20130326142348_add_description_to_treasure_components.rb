class AddDescriptionToTreasureComponents < ActiveRecord::Migration
  def change
    add_column :treasure_components, :description, :text
  end
end
