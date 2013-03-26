class AddHeroToItems < ActiveRecord::Migration
  def change
    change_table :items do |f|
      f.references :hero
    end
  end
end
