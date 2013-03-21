class CreateAchievementInstances < ActiveRecord::Migration
  def change
    create_table :achievement_instances do |t|
      t.references :hero
      t.references :achievement
      t.text :description

      t.timestamps
    end
    add_index :achievement_instances, :hero_id
    add_index :achievement_instances, :achievement_id
  end
end
