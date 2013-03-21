class DeleteHeroAndInstanceFromAchievements < ActiveRecord::Migration
  def change
     remove_column :achievements, :hero, :instance
  end
end
