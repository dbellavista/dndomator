class AddProgressSuccessProgressFailureToSkillChallenge < ActiveRecord::Migration
  def change
    add_column :skill_challenges, :progress_success, :integer
    add_column :skill_challenges, :progress_failure, :integer
  end
end
