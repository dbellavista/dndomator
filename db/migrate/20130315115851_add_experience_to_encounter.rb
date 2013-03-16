class AddExperienceToEncounter < ActiveRecord::Migration
  def change
    add_column :encounters, :experience, :integer
  end
end
