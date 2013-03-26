class AddPerceptionInsightFortitudeReflexWillToHeros < ActiveRecord::Migration
  def change
    add_column :heros, :perception, :integer
    add_column :heros, :insight, :integer
    add_column :heros, :fortitude, :integer
    add_column :heros, :reflex, :integer
    add_column :heros, :will, :integer
  end
end
