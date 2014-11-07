class WhatiwantController < ApplicationController

	def whatiwant
		@user = current_user
		@automakes = Automodels.find(:all, :order => 'make ASC', :select => 'distinct make')

    @automodels = params[:make].blank? ? Automodels.all : Automodels.find_all_by_make(params[:make], :order => "model ASC")

    #@automodels = "" #send a blank list when the page is first loaded so it can be replaced by the partial when a Make is selected

		@autocategories = Autocategories.find(:all, :order => 'category ASC')

		@motocategories = Motocategories.find(:all, :order => 'category ASC')
		@motomakes = Motomakes.find(:all, :order => 'sort_order ASC')
		@marinecategories = Marinecategories.find(:all, :order => 'category ASC', :select => 'distinct category')

		#@marinesubcategories = "" #Marinecategories.find(:all, :order => 'subcategory ASC')
    @marinesubcategories = params[:category].blank? ? Marinecategories.find(:all, :order => 'subcategory ASC') : Marinecategories.find_all_by_category(params[:category], :order => "subcategory ASC").map{|m| [m.subcategory, m.subcategory]}
		@marinemakes = Marinemakes.find(:all, :order => 'make ASC')
		@powercategories = Powercategories.find(:all, :order => 'category ASC', :select => 'distinct category')

		#@powersubcategories = "" #Powercategories.find(:all, :order => 'subcategory ASC')

    @powersubcategories = params[:category].blank? ? Powercategories.find(:all, :order => 'subcategory ASC') : Powercategories.find_all_by_category(params[:category], :order => "subcategory ASC").map{|m| [m.subcategory, m.subcategory]}

		@powermakes = Powermakes.find(:all, :order => 'sort_order ASC')
		#@search = Listing.new_search(params[:search]) #TIDO
		#@q = Listing.search_m(params[:q])
    #puts @search.inspect
    #puts "______________________________________"
  #	@listings_count = @search.count
	end
	
	def get_automodels
		@automodels = Automodels.find_all_by_make(params[:make], :order => "model ASC").map{|m| [m.model, m.model]}
    render :json => @automodels
	end

	def get_marinesubcategories
		@marinesubcategories = Marinecategories.find_all_by_category(params[:category], :order => "subcategory ASC").map{|m| [m.subcategory, m.subcategory]}

    render :json => @marinesubcategories
	end

	def get_powersubcategories
		@powersubcategories = Powercategories.find_all_by_category(params[:category], :order => "subcategory ASC").map{|m| [m.subcategory, m.subcategory]}

    render :json => @powersubcategories
	end

end
