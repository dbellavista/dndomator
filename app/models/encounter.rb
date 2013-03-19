class Encounter < ActiveRecord::Base

  def self.exp
    [100, 125, 150, 175, 200, 250, 300, 350, 400, 500, 600, 700, 800, 1000, 1200, 1400, 1600, 2000, 2400, 2800, 3200, 4150, 5100, 6050, 7000, 9000, 11000, 13000, 15000, 19000]
  end

  def target_level hero_num
    Encounter.exp.each_with_index do |e, i|
      return i if self.experience < e * hero_num
    end
    return 0
  end

  has_and_belongs_to_many :monsters
  accepts_nested_attributes_for :monsters
  attr_accessible :monsters
  attr_accessible :name, :experience, :completed

end
