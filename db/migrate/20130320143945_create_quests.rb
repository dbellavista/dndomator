class CreateQuests < ActiveRecord::Migration
  def change
    create_table :quests do |t|
      t.string :name
      t.string :kind
      t.text :description
      t.integer :level
      t.boolean :completed
      t.boolean :succeded

      t.timestamps
    end
  end
end
