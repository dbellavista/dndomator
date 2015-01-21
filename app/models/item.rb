class Item < ActiveRecord::Base

  has_many :treasure_components
  has_many :heros, :through => :treasure_components
  attr_accessible :level, :name, :value

  def self.relative_item_path
    "/imgs/items/"
  end

  def self.item_path
    "#{Rails.root}/public/#{relative_item_path}"
  end

  def image
    return if self.name.nil? or self.level.nil?
    return Item.relative_item_path + self.level.to_s + "_" + self.name + ".png"
  end

  def self.accepted_formats
    ['.png', '.jpg']
  end

  def self.values
    [0, 360, 520, 680, 840, 1000, 1800, 2600, 3400, 4200, 5000, 9000, 13000,
     17000, 21000, 25000, 45000, 65000, 85000, 105000, 1225000, 225000, 325000,
     425000, 525000, 625000, 1125000, 1625000, 2125000, 2625000, 3125000 ]
  end

end
