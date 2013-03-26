class RemoveHeroFromItems < ActiveRecord::Migration
  def change
     remove_column :items, :hero
  end
end
