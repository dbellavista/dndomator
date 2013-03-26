class TreasureComponent < ActiveRecord::Base
  belongs_to :treasure
  belongs_to :item
  belongs_to :hero
  attr_accessible :quantity, :quantity_assigned, :hero, :item, :treasure, :description

  def complete?
    return self.quantity == self.quantity_assigned
  end

end
