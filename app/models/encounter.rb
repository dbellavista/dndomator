class Encounter < ActiveRecord::Base

  has_and_belongs_to_many :monsters
  accepts_nested_attributes_for :monsters
  attr_accessible :monsters
  attr_accessible :name, :experience, :completed
end
