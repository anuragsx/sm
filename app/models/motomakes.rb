class Motomakes < ActiveRecord::Base
  attr_accessible :make, :sort_order
	validates_presence_of :sort_order
	validates_presence_of :make
end
