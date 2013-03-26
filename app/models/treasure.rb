class Treasure < ActiveRecord::Base

  has_many :treasure_components
  has_many :items, :through => :treasure_components
  accepts_nested_attributes_for :items
  attr_accessible :description, :level, :quantity, :quantity_assigned, :packet, :items

  def complete?
    self.treasure_components.each do |component|
      return false unless component.complete?
    end
    return true
  end

  def self.next_packet level
    packet = 1
    packet += 1 while !Treasure.where("level = ? AND packet = ?", level, packet).empty?
    return packet
  end
end
