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
	#cattr_reader :per_page
  #@@per_page = 50

	#default_scope :conditions => ["expired_at >= ?", Date.today]

  #self.per_page = 2
  #paginates_per 1


  def self.search_m(params)
    query_obj = Listing.joins(:owner)
    query_obj = query_obj.where("listingtype = ?", params[:listing_type])
    query_obj = query_obj.where("make = ?", "#{params[:make]}") unless params[:make].blank?

    unless params[:model].blank?
      query_obj = query_obj.where("model = ?", params[:model]) unless params[:model]=="Select your Model"
    end

    if (params[:listing_type] == "auto")
      query_obj = query_obj.where("body = ?", params[:category]) unless params[:category].blank?
    else
      query_obj = query_obj.where("category = ?", params[:category]) unless params[:category].blank?
    end

    unless params[:sub_category].blank?
      query_obj = query_obj.where("subcategory = ?", "#{params[:sub_category]}") unless params[:sub_category]=="Select your Subcategory"
    end


    query_obj = query_obj.where("users.state = ?", "#{params[:state]}") unless params[:state].blank?

    if (!params[:year_gte].blank? && !params[:year_lte].blank?)
      query_obj = query_obj.where(year: (params[:year_gte])..(params[:year_lte]))
    end

    if (!params[:price_min].blank? && !params[:price_max].blank?)
      query_obj = query_obj.where(price: (params[:price_min])..(params[:price_max]))
    end

    query_obj = query_obj.where("length = ?", "#{params[:length]}") unless params[:length].blank?

    query_obj = query_obj.where("price = ?", "#{params[:price]}") unless params[:price].blank?
    query_obj = query_obj.where("mileage = ?", "#{params[:mileage]}") unless params[:mileage].blank?
    query_obj = query_obj.where("exterior_color = ?", "#{params[:exterior_color]}") unless params[:exterior_color].blank?
    query_obj = query_obj.where("interior_color = ?", "#{params[:interior_color]}") unless params[:interior_color].blank?
    query_obj = query_obj.where("doors = ?", "#{params[:doors]}") unless params[:doors].blank?
    query_obj = query_obj.where("engine = ?", "#{params[:engine]}") unless params[:engine].blank?
    query_obj = query_obj.where("transmission = ?", "#{params[:transmission]}") unless params[:transmission].blank?
    query_obj = query_obj.where("drive = ?", "#{params[:drive]}") unless params[:drive].blank?
    query_obj = query_obj.where("fuel = ?", "#{params[:fuel]}") unless params[:fuel].blank?
    query_obj = query_obj.where("desc = ?", "#{params[:desc]}") unless params[:desc].blank?
    query_obj = query_obj.where("hull = ?", "#{params[:hull]}") unless params[:hull].blank?

    query_obj
  end

  def self.search_perfect_match(params)
    query_obj = joins(:wishlists)
    query_obj = query_obj.where("listings.listingtype = ?", "#{params['listings.listingtype']}") unless params['listings.listingtype'].blank?
    query_obj = query_obj.where("listings.make = ?", "#{params['listings.make']}") unless params['listings.make'].blank?
    unless params[params['listings.model']].blank?
      query_obj = query_obj.where("listings.model = ?", params['listings.model']) unless params['listings.model']=="Select your Model"
    end
    query_obj = query_obj.where("listings.body = ?", "#{params['listings.category']}") unless params['listings.category'].blank?
    query_obj = query_obj.where("listings.category = ?", "#{params['listings.category']}") unless params['listings.category'].blank?
    query_obj = query_obj.where("listings.subcategory = ?", "#{params['listings.subcategory']}") unless params['listings.subcategory'].blank?


    query_obj = query_obj.where("wishlists.listingtype = ?", "#{params['wishlists.listingtype']}") unless params['wishlists.listingtype'].blank?
    query_obj = query_obj.where("wishlists.make = ?", "#{params['wishlists.make']}") unless params['wishlists.make'].blank?
    unless params[params['wishlists.model']].blank?
      query_obj = query_obj.where("wishlists.model = ?", params['wishlists.model']) unless params['wishlists.model']=="Select your Model"
    end
    query_obj = query_obj.where("wishlists.body = ?", "#{params['wishlists.body']}") unless params['wishlists.body'].blank?
    query_obj = query_obj.where("wishlists.category = ?", "#{params['wishlists.category']}") unless params['wishlists.category'].blank?
    query_obj = query_obj.where("wishlists.subcategory = ?", "#{params['wishlists.subcategory']}") unless params['wishlists.subcategory'].blank?
    puts "--------------------------"
    puts query_obj.inspect
    query_obj
  end


end
