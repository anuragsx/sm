class Powercategories < ActiveRecord::Base
  attr_accessible :category, :subcategory
	validates_presence_of :category
	validates_presence_of :subcategory
end
