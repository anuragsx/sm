class Automodels < ActiveRecord::Base

  attr_accessible :make, :model
	validates_presence_of :make
	validates_presence_of :model

end
