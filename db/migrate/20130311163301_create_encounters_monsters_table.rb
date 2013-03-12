class CreateEncountersMonstersTable < ActiveRecord::Migration
  def change
    create_table :encounters_monsters do |t|
      t.references :encounter
      t.references :monster
    end
    add_index :encounters_monsters, [:encounter_id, :monster_id]
  end
end
