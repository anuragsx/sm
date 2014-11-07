class Motocategories < ActiveRecord::Base
  attr_accessible :category
	validates_presence_of :category
end
