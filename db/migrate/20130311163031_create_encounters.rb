class CreateEncounters < ActiveRecord::Migration
  def change
    create_table :encounters do |t|
      t.string :name

      t.timestamps
    end
  end
end
