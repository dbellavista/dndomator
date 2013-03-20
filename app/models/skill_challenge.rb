class SkillChallenge < ActiveRecord::Base
  attr_accessible :completed, :complexity, :context, :failure, :level, :name, :primary_skill, :secondary_skill, :succeded, :success, :progress_success, :progress_failure

  def experience
    return SkillChallenge.experience[self.level - 1] * self.complexity
  end

  def number_of_success
    return SkillChallenge.success[self.complexity - 1]
  end

  def number_of_failures
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
