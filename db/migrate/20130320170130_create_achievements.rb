class CreateAchievements < ActiveRecord::Migration
  def change
    create_table :achievements do |t|
      t.string :name
      t.text :description
      t.text :instance
      t.references :hero

      t.timestamps
    end
    add_index :achievements, :hero_id
  end
end
