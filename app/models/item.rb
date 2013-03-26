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
end
