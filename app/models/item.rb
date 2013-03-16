class Item < ActiveRecord::Base
  attr_accessible :level, :name, :value

  def self.relative_item_path
    "/imgs/items/"
  end

  def self.item_path
    "#{Rails.root}/public/#{relative_item_path}"
  end

  def self.image_of item
    return if item.name.nil? or item.level.nil?
    return Item.relative_item_path + item.level.to_s + "_" + item.name + ".png"
  end

  def self.accepted_formats
    ['.png', '.jpg']
  end
end
