class CreateMonsters < ActiveRecord::Migration
  def change
    create_table :monsters do |t|
      t.string :name
      t.integer :level

      t.timestamps
    end
  end
end
