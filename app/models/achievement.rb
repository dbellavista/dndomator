class Achievement < ActiveRecord::Base

  belongs_to :hero
  attr_accessible :description, :instance, :name, :hero

  validates :instance, :presence => {:message => "Instance is required if hero is present"}, :if => lambda { |o| !o.hero.nil? }

  def image
    return Achievement.relative_achievements_path + self.name.downcase + ".png"
  end

  def self.relative_achievements_path
    "/imgs/achievements/"
  end

end
