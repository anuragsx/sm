class HomeController < ApplicationController
	layout "application", :except => :index
  def index

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

    @featuredauto = Listing.where("featured = ? AND listingtype = ?", true, 'auto').first
    @featuredmoto = Listing.where("featured = ? AND listingtype = ?", true, 'moto').first
    @featuredmarine = Listing.where("featured = ? AND listingtype = ?", true, 'marine').first
    @featuredpower = Listing.where("featured = ? AND listingtype = ?", true, 'power').first
  	
  	#@automakes = Automodels.find(:all, :order => 'make ASC', :select => 'distinct make')
  	#@automodels = ""
  	#@autocategories = Autocategories.all
  	#@search = Listing.new_search(params[:search]) TODO
    @search = Listing.all
    unless @search.blank?
      @listings = @search #TODO
      @listings_count = @search.count #TODO
    end

  	
  	render :action => "index", :layout => "home"
  end

  def faq
  end

  def about
  end

  def contact
  	@message = Message.new
  end
  
  def admin
  	@user = current_user
  	if @user
  		if @user.admin
  			render
  		else
  			flash[:notice] = 'Restricted Page'
  			redirect_to(root_url)
  		end
  	else
  		flash[:notice] = 'Restricted Page'
 			redirect_to(root_url)
 		end
  end
  
end
