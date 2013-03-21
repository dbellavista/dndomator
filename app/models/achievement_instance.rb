class AchievementInstance < ActiveRecord::Base
  belongs_to :hero
  belongs_to :achievement
  attr_accessible :description, :hero, :achievement
end
