class AddCompletedToEncounter < ActiveRecord::Migration
  def change
    add_column :encounters, :completed, :boolean
  end
end
