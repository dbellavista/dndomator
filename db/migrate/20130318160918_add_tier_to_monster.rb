class AddTierToMonster < ActiveRecord::Migration
  def change
    add_column :monsters, :tier, :string
  end
end
