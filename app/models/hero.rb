class Hero < ActiveRecord::Base

  has_many :treasure_components
  has_many :items, :through => :treasure_components
  has_many :achievement_instances
  has_many :achievements, :through => :achievement_instances
  attr_accessible :name, :player, :background, :experience, :hero_class, :race, :perception, :insight, :fortitude, :will, :reflex

  def passive_insight
    self.perception + 10
  end

  def passive_perception
    self.perception + 10
  end

  def not_yet_given_items
    not_given_items = []
    self.treasure_components.each do |treasure|
      not_given_items << treasure.item unless treasure.complete?
    end
    return not_given_items
  end

  def given_items
    given_items = []
    self.treasure_components.each do |treasure|
      given_items << treasure.item if treasure.complete?
    end
    return given_items
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

  def exp_percentage
    base_exp = Hero.ex_points[level - 1]
    return (100 * (experience - base_exp)) / (next_experience - base_exp)
  end

  private
    def self.ex_points
      [ 0, 1000, 2250, 3750, 5500, 7500, 10000, 13000, 16500, 20500, 26000,
        32000, 39000, 47000, 57000, 69000, 83000, 99000, 119000, 143000,
        175000, 210000, 255000, 310000, 375000, 450000, 550000, 675000, 825000,
        1000000];
    end
end
