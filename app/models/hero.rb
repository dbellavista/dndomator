class Hero < ActiveRecord::Base

  has_many :treasures
  has_many :achievements
  attr_accessible :name, :player, :background, :experience

  def not_yet_given_items
    items = []
    treasures = Treasure.find_all_by_hero_id(self.id) || []
    treasures.each do |treasure|
      items << treasure.item unless Treasure.complete?(treasure)
    end
    return items
  end
  def given_items
    items = []
    treasures = Treasure.find_all_by_hero_id(self.id) || []
    treasures.each do |treasure|
      items << treasure.item if Treasure.complete?(treasure)
    end
    return items
  end

  def level
    Hero.ex_points.each_with_index do |v,i|
      return i unless self.experience >= v
    end
    return 30
  end

  def next_experience
    return Hero.ex_points[29] if self.level > 29
    return Hero.ex_points[self.level]
  end

  def self.assign_experience experience
    heros = Hero.all();
    exp = experience / heros.length;

    heros.each do |hero|
      hero.update_attribute :experience, hero.experience + exp;
    end
    return exp
  end

  private
    def self.ex_points
      [ 0, 1000, 2250, 3750, 5500, 7500, 10000, 13000, 16500, 20500, 26000,
        32000, 39000, 47000, 57000, 69000, 83000, 99000, 119000, 143000,
        175000, 210000, 255000, 310000, 375000, 450000, 550000, 675000, 825000,
        1000000];
    end
end
