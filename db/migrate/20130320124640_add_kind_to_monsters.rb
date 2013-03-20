class AddKindToMonsters < ActiveRecord::Migration
  def change
    add_column :monsters, :kind, :string
  end
end
