class SkillChallenge < ActiveRecord::Base
  attr_accessible :completed, :complexity, :context, :failure, :level, :name, :primary_skill, :secondary_skill, :succeded, :success, :progress_success, :progress_failure

  def self.experience_of skill_challenge
    return self.experience[skill_challenge.level - 1] * skill_challenge.complexity
  end

  def self.number_of_success skill_challenge
    return self.success[skill_challenge.complexity - 1]
  end

  def self.number_of_failures skill_challenge
    return 3
  end

  private
  def self.experience
    [100, 125, 150, 175, 200, 250, 300, 350, 400, 500, 600, 700, 800, 1000, 1200, 1400, 1600, 2000, 2400, 2800, 3200, 4150, 5100, 6050, 7000, 9000, 11000, 13000, 15000, 19000]
  end
  def self.success
    [4, 6, 8, 10, 12]
  end
end
