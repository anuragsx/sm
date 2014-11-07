class Marinemakes < ActiveRecord::Base
  attr_accessible :make
	validates_presence_of :make
end
