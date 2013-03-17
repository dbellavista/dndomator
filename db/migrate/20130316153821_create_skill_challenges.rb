class CreateSkillChallenges < ActiveRecord::Migration
  def change
    create_table :skill_challenges do |t|
      t.string :name
      t.text :context
      t.integer :complexity
      t.integer :level
      t.text :primary_skill
      t.text :secondary_skill
      t.text :success
      t.text :failure
      t.boolean :completed
      t.boolean :succeded

      t.timestamps
    end
  end
end
