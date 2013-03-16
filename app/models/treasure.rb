class Treasure < ActiveRecord::Base
  belongs_to :item
  belongs_to :hero
  attr_accessible :description, :level, :quantity, :quantity_assigned, :packet, :item, :hero

  def self.complete? treasure
    return treasure.quantity == treasure.quantity_assigned
  end

  def self.next_packet level
    packet = 1
    packet += 1 while !Treasure.where("level = ? AND packet = ?", level, packet).empty?
    return packet
  end
end
