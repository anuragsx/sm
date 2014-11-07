class Wishlist < ActiveRecord::Base

  attr_accessible :listingtype, :min_year, :max_year, :body, :make, :model, :min_price, :max_price, :category,
                  :subcategory

	belongs_to :users
	validates_presence_of :listingtype
end
