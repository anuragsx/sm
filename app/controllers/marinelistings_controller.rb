class MarinelistingsController < ApplicationController
  layout "application"
	def searchmarine
  	#@search = Listing.new_search(params[:search])
  	@marinecategories = Marinecategories.find(:all, :order => 'category ASC', :select => 'distinct category')
		@marinesubcategories = "" #Marinecategories.find_all_by_category(params[:search][:conditions][:category_is], :order => "subcategory ASC", :select => 'distinct subcategory').map{|m| [m.subcategory, m.subcategory]}
    @marinesubcategories = params[:cateogry].blank? ? Marinecategories.all(:order => "subcategory ASC", :select => 'distinct subcategory') : Marinecategories.find_all_by_category(params[:search][:conditions][:category_is], :order => "subcategory ASC", :select => 'distinct subcategory')
		@marinemakes = Marinemakes.find(:all, :order => 'make ASC')
		
  	#@listings = @search.all
  	#@listings_count = @search.count
  end
  
  def marinelistingsresults
		@marinecategories = Marinecategories.find(:all, :order => 'category ASC', :select => 'distinct category')

    marine_by_category = Marinecategories.find_all_by_category(params[:category],
                                                               :order => "subcategory ASC",
                                                               :select => 'distinct subcategory')

    all_marine = Marinecategories.find(:all, :order => "subcategory ASC",
                                              :select => 'distinct subcategory')

    @marinesubcategories = params[:category].blank? ? all_marine : marine_by_category

		#@marinesubcategories = Marinecategories.find_all_by_category(params[:search][:conditions][:category_is], :order => "subcategory ASC", :select => 'distinct subcategory').map{|m| [m.subcategory, m.subcategory]}
		@marinemakes = Marinemakes.find(:all, :order => 'make ASC')
		
		#Comment this SearchLogic code when I can build the conditions strings from params and userlistings
		#@search = Listing.new_search(params[:search])
    @listings = Listing.where("listingtype = ?", params["listing_type"])
    @listings_count = @listings.count
		#@listings = @search.all
		#@listings_count = @search.count
		
	##Perfect Swap "Matching" functionality
		if current_user		
			#Get all params from search form and build a conditions string
			#@listingconditions = params[:search][:conditions].reject{|key,value|value.nil?}
			@wishlistconditions = {'listings.listingtype' => params["listing_type"]}
			@wishlistconditions['listings.category'] = params[:category]
			@wishlistconditions['listings.subcategory'] = params[:subcategory]
			@wishlistconditions['listings.make'] = params[:make]
		
			#Get current_user listings and build a wishlists conditions string
			@user = current_user
			@userlistings = @user.listings.all
			@userlistings.each do |userlisting|
			#add conditions to the @wishlistconidtions unless there is no value in the field...
				unless userlisting.listingtype
					@wishlistconditions['wishlists.listingtype'] = userlisting.listingtype
				end
				unless userlisting.category
					@wishlistconditions['wishlists.category'] = userlisting.category
				end
				unless userlisting.subcategory
					@wishlistconditions['wishlists.subcategory'] = userlisting.subcategory
				end
				unless userlisting.make
					@wishlistconditions['wishlists.make'] = userlisting.make
				end
			end
		
			#Execute Perfectresults query by using listings search form conditions hash and wishlists conditions hash
			#@perfectresults = Listing.find(:all, :joins => :wishlists, :conditions => {:wishlists => @wishlistconditions})
			@perfectresults = Listing.find(:all, :joins => :wishlists, :conditions => @wishlistconditions)
			@perfectresults_count = @perfectresults.count
		end
				
		respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @listing }
    end
	end
  
	def get_marinesubcategories
		@marinesubcategories = Marinecategories.find_all_by_category(params[:category], :order => "subcategory ASC").map{|m| [m.subcategory, m.subcategory]}
		
		render :update do |page|
			page.replace_html('marinesubcategoriesdiv', :partial => 'marinesubcategories_select', :object => @marinesubcategories)
		end
	end
	
  # GET /listings/1
  # GET /listings/1.xml
  def show
    @listing = Listing.find(params[:id])
    @message = Message.new

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @listing }
    end
  end

  # GET /listings/new
  # GET /listings/new.xml
  def new
  	@user = current_user
    @listing = @user.listings.new(params[:listing])
    @marinecategories = Marinecategories.find(:all, :order => 'category ASC', :select => 'distinct category')
		@marinesubcategories = "" #Marinecategories.find(:all, :order => 'subcategory ASC')
		@marinemakes = Marinemakes.find(:all, :order => 'make ASC')

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @listing }
    end
  end

  # GET /listings/1/edit
  def edit
    @listing = Listing.find(params[:user_id])
  end

  # POST /listings
  # POST /listings.xml
  def create
		@user = current_user
    @listing = @user.listings.new(params[:listing])

    respond_to do |format|
      if @listing.save
        flash[:notice] = 'Listing was successfully created.'
        format.html { redirect_to(@listing) }
        format.xml  { render :xml => @listing, :status => :created, :location => @listing }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @listing.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /listings/1
  # PUT /listings/1.xml
  def update
    @listing = Listing.find(params[:id])

    respond_to do |format|
      if @listing.update_attributes(params[:listing])
        flash[:notice] = 'Listing was successfully updated.'
        format.html { redirect_to(@listing) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @listing.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /listings/1
  # DELETE /listings/1.xml
  def destroy
    @listing = Listing.find(params[:id])
    @listing.destroy

    respond_to do |format|
    	flash[:notice] = 'Listing was successfully deleted.'
      format.html { redirect_to(listings_url) }
      format.xml  { head :ok }
    end
  end
  
end
