class AddBackgroundToHero < ActiveRecord::Migration
  def change
    add_column :heros, :background, :text
  end
end
