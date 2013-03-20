class Quest < ActiveRecord::Base

  def self.kinds
    ["major", "minor"]
  end

  kinds.each_with_index do |t|
    define_method("#{t}?") { kind == t }
  end

  def experience
    Quest.experience[self.level - 1] * ((self.major?) ? Hero.count : 1);
  end

  attr_accessible :completed, :description, :kind, :level, :name, :succeded
  validates :kind, :inclusion => { :in => Quest.kinds }

  private
    def self.experience
      [100, 125, 150, 175, 200, 250, 300, 350, 400, 500, 600, 700, 800, 1000, 1200, 1400, 1600, 2000, 2400, 2800, 3200, 4150, 5100, 6050, 7000, 9000, 11000, 13000, 15000, 19000]
    end
end
