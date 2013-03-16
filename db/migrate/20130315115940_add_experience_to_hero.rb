class AddExperienceToHero < ActiveRecord::Migration
  def change
    add_column :heros, :experience, :integer
  end
end
