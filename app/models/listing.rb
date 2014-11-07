class Listing < ActiveRecord::Base

  attr_accessible :listingtype, :expired_at, :year, :mileage, :make, :vin, :model, :price, :body, :desc, :exterior_color,
                  :interior_color, :doors, :engine, :transmission, :drive, :fuel, :category, :subcategory, :length, :hull

  STATES = ['AK','AL','AR','AZ','CA','CO','CT','DE','FL','GA','HI','IA','ID','IL','IN','KS','KY','LA','MA','MD','ME','MI',
            'MN','MO','MS','MT','NC','ND','NE','NH','NJ','NM','NV','NY','OH','OK','OR','PA','RI','SC','SD','TN','TX','UT','VA',
            'VT','WA','WI','WV','WY']

	validates :listingtype, :presence => true

	validates :price, :mileage, :numericality =>
                    { :only_integer => true,
                      :message => "is not a number or contains extra characters.  Please use only numbers.",
                      :allow_nil => true
                    }
	belongs_to :users
	belongs_to :owner, :class_name => "User", :foreign_key => "user_id"
	has_many :messages
	has_many :photos, :dependent => :destroy
	has_many :wishlists, :foreign_key => "user_id", :primary_key => "user_id"
#will_paginate stuff
	cattr_reader :per_page
  @@per_page = 50

	#default_scope :conditions => ["expired_at >= ?", Date.today]

  def self.search_m(params)
   Listing.where("make = ? AND model = ? AND category = ? price = ?", params[:make], params[:model], params[:category], )
  end
end
