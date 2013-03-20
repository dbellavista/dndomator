class AddSetupAndTacticsAndFeaturesAndConclusionToEncounter < ActiveRecord::Migration
  def change
    add_column :encounters, :setup, :text
    add_column :encounters, :tactics, :text
    add_column :encounters, :features, :text
    add_column :encounters, :conclusion, :text
  end
end
