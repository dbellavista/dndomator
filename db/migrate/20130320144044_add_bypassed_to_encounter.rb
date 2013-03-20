class AddBypassedToEncounter < ActiveRecord::Migration
  def change
    add_column :encounters, :bypassed, :boolean
  end
end
