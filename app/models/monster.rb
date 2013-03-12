class Monster < ActiveRecord::Base
  attr_accessible :level, :name
  has_and_belongs_to_many :encounters

  def self.relative_monster_path
    "/imgs/monsters/"
  end

  def self.monster_path
    "#{Rails.root}/public/#{relative_monster_path}"
  end

  def self.image_of monster
    return Monster.relative_monster_path + monster.level.to_s + "_" + monster.name + ".png"
  end

  def self.accepted_formats
    ['.png', '.jpg']
  end
end
