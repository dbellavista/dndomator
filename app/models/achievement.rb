class Achievement < ActiveRecord::Base

  has_many :achievement_instances, :order => 'created_at DESC'
  has_many :heros, :through => :achievement_instances
  attr_accessible :description, :name


  def image
    return Achievement.relative_achievements_path + self.name.downcase + ".png"
  end

  def self.relative_achievements_path
    "/imgs/achievements/"
  end

end
