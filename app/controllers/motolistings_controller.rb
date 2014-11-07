class MotolistingsController < ApplicationController
  layout "application"
	def searchmotos
  	#@search = Listing.new_search(params[:search])
  	@motomakes = Motomakes.find(:all, :order => 'sort_order ASC', :select => 'distinct make')
		@motocategories = Motocategories.find(:all, :order => 'category ASC')
		
  	#@listings = @search.all
  	#@listings_count = @search.count
  end

=begin
	def motolistingsresults
		@motomakes = Motomakes.find(:all, :order => 'sort_order ASC', :select => 'distinct make')
		@motocategories = Motocategories.find(:all, :order => 'category ASC')
		
		#Comment this SearchLogic code when I can build the conditions strings from params and userlistings
		@search = Listing.new_search(params[:search])
		@listings = @search.all
		@listings_count = @search.count
		
	##Perfect Swap "Matching" functionality
		if current_user		
			#Get all params from search form and build a conditions string
			#@listingconditions = params[:search][:conditions].reject{|key,value|value.nil?}
			@wishlistconditions = {'listings.listingtype' => params[:search][:conditions][:listingtype_is]}
			@wishlistconditions['listings.category'] = params[:search][:conditions][:category_is]
			@wishlistconditions['listings.make'] = params[:search][:conditions][:make_is]
		
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
=end


  def motolistingsresults
    @motomakes = Motomakes.find(:all, :order => 'sort_order ASC', :select => 'distinct make')
    @motocategories = Motocategories.find(:all, :order => 'category ASC')

    #Comment this SearchLogic code when I can build the conditions strings from params and userlistings
    #@search = Listing.new_search(params[:search])
    @listings = Listing.where("listingtype = ?", params["listing_type"])
    @listings_count = @listings.count

    ##Perfect Swap "Matching" functionality
    if current_user
      #Get all params from search form and build a conditions string
      #@listingconditions = params[:search][:conditions].reject{|key,value|value.nil?}
      @wishlistconditions = {'listings.listingtype' => params["listing_type"]}
      @wishlistconditions['listings.category'] = params[:category]
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
		@motocategories = Motocategories.find(:all, :order => 'category ASC')
		@motomakes = Motomakes.find(:all, :order => 'sort_order ASC')

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
