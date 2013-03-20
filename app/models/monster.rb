class Monster < ActiveRecord::Base

  private
    def self.exp
      [0, 100, 125, 150, 175, 200, 250, 300, 350, 400, 500, 600, 700, 800, 1000, 1200, 1400, 1600, 2000, 2400, 2800, 3200, 4150, 5100, 6050, 7000, 9000, 11000, 13000, 15000, 19000]
    end

  public

  def self.uncategorized
    "uncategorized"
  end

  def self.experience
    { "normal" => self.exp.map{ |x| x * 1},
      "elite" => self.exp.map{ |x| x * 2},
      "minion" => self.exp.map{ |x| x / 4},
      "solo" => self.exp.map{ |x| x * 5}
    }
  end

  def self.tiers
    self.experience.keys
  end

  def self.kinds
    ["creature", "trap", "hazard", "terrain", uncategorized]
  end

  tiers.each_with_index do |t|
    define_method("#{t}?") { tier == t }
  end
  kinds.each_with_index do |t|
    define_method("#{t}?") { kind == t }
  end

  attr_accessible :level, :name, :tier, :kind
  has_and_belongs_to_many :encounters
  validates :tier, :inclusion => { :in => Monster.tiers }
  validates :kind, :inclusion => { :in => Monster.kinds }

  def experience
    Monster.experience[self.tier][self.level]
  end

  def self.relative_monster_path
    "/imgs/monsters/"
  end

  def self.monster_path
    "#{Rails.root}/public/#{relative_monster_path}"
  end

  def image
    return Monster.relative_monster_path + self.level.to_s + "_" + self.name + ".png"
  end

  def self.accepted_formats
    ['.png', '.jpg']
  end

end
