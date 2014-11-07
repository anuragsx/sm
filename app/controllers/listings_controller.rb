class ListingsController < ApplicationController

	def admin
		
		respond_to do |format|
			@user = current_user
			if @user
				if @user.admin
					page = params[:page] || 1
					@listings = Listing.paginate :page => params[:page], :order => 'created_at DESC'
					@listings_count = @listings.count
			    format.html # admin.html.erb
			  else
			  	flash[:notice] = 'Restricted Page'
			  	format.html {redirect_to(root_url)}
			  end
		  else
		  	flash[:notice] = 'Restricted Page'
		  	format.html {redirect_to(root_url)}
		  end
		end
  end
	
	def admin_edit
  	@user = current_user
    @listing = Listing.find(params[:id])
		
		if @user
			if @user.admin
			#Admin user is logged in 
				if @listing.listingtype == "auto"
					@automakes = Automodels.find(:all, :order => 'make ASC', :select => 'distinct make')
					@automodels = Automodels.find_all_by_make(@listing.make, :order => "model ASC").map{|m| [m.model, m.model]}
					@autocategories = Autocategories.all
				elsif @listing.listingtype == "moto"
					@motocategories = Motocategories.find(:all, :order => 'category ASC')
					@motomakes = Motomakes.find(:all, :order => 'sort_order ASC')
				elsif @listing.listingtype == "marine"
					@marinecategories = Marinecategories.find(:all, :order => 'category ASC', :select => 'distinct category')
					@marinesubcategories = Marinecategories.find_all_by_category(@listing.category, :order => "subcategory ASC").map{|m| [m.subcategory, m.subcategory]}
					@marinemakes = Marinemakes.find(:all, :order => 'make ASC')
				elsif @listing.listingtype == "power"
					@powercategories = Powercategories.find(:all, :order => 'category ASC', :select => 'distinct category')
					@powersubcategories = Powercategories.find_all_by_category(@listing.category, :order => "subcategory ASC").map{|m| [m.subcategory, m.subcategory]}
					@powermakes = Powermakes.find(:all, :order => 'sort_order ASC')
				else
				#Redirect non-admin user to home page
					respond_to do |format|
						flash[:notice] = 'Restricted Page'
						format.html {redirect_to(root_url)}
					end
				end
		
				@photo = @listing.photos.new(params[:photo])
				@photo_count = @listing.photos.count
			
				render "edit"
			end
		else
		#Redirect non-admin user to home page
			respond_to do |format|
				flash[:notice] = 'Restricted Page'
				format.html {redirect_to(root_url)}
			end
		end
  end
	
	def get_automodels
		@automodels = Automodels.find_all_by_make(params[:make], :order => "model ASC").map{|m| [m.model, m.model]}
		
		render :update do |page|
			page.replace_html('automodelsdiv', :partial => 'automodels_select', :object => @automodels)
		end
	end
	  
	def get_marinesubcategories
		@marinesubcategories = Marinecategories.find_all_by_category(params[:category], :order => "subcategory ASC").map{|m| [m.subcategory, m.subcategory]}
		
		render :update do |page|
			page.replace_html('marinesubcategoriesdiv', :partial => 'marinesubcategories_select', :object => @marinesubcategories)
		end
	end
	
	def get_powersubcategories
		@powersubcategories = Powercategories.find_all_by_category(params[:category], :order => "subcategory ASC").map{|m| [m.subcategory, m.subcategory]}
		
		render :update do |page|
			page.replace_html('powersubcategoriesdiv', :partial => 'powersubcategories_select', :object => @powersubcategories)
		end
	end
	
	def replacebigphoto
		@listing = Listing.find(params[:listing_id])
		@bigphoto = @listing.photos.find(params[:id])
		
		render :update do |page|
			page.replace_html('bigphoto', :partial => 'bigphoto', :object => @bigphoto)
		end
	end
	
  # GET /listings
  # GET /listings.xml
  def index
    if current_user
      @user = current_user
      @listings = @user.listings
      @listings_count = @user.listings.count
    else
      redirect_to new_user_path
    end
  end

  # GET /listings/1
  # GET /listings/1.xml
  def show
    @listing = Listing.find(params[:id])
    if current_user
    	@message = Message.new
    	@favorites = Favorite.new
    end
    @sender = current_user
    @recipient = @listing.owner
    @photo_count = @listing.photos.count

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @listing }
    end
  end
	
	def newmain
		@user = current_user
	end
  # GET /listings/new@automakes = Automodels.find(:all, :order => 'make ASC', :select => 'distinct make')
  # GET /listings/new.xml
  def new
  	if current_user
	  	@user = current_user
	    @listing = @user.listings.new(params[:listing])
	    @automakes = Automodels.find(:all, :order => 'make ASC', :select => 'distinct make')
	    @automodels = ""
	    @autocategories = Autocategories.all
	
	    respond_to do |format|
	      format.html # new.html.erb
	      format.xml  { render :xml => @listing }
	    end
	  else
	  	redirect_to new_user_path
	  end
  end

  # GET /listings/1/edit
  def edit
  	@user = current_user
    @listing = Listing.find(params[:id])
    #@listing = current_user.listings.where("id = ?", params[:id]) #TODO
  	#Stop other users from editing listings that don't belong to them!
  	if @user
			#if @user.id != @listing.user
				#redirect_to @listing
			#else
				#Current user logged in is editing his own listing
				if @listing.listingtype == "auto"
					@automakes = Automodels.find(:all, :order => 'make ASC', :select => 'distinct make')
					@automodels = Automodels.find_all_by_make(@listing.make, :order => "model ASC").map{|m| [m.model, m.model]}
					@autocategories = Autocategories.all
				elsif @listing.listingtype == "moto"
					@motocategories = Motocategories.find(:all, :order => 'category ASC')
					@motomakes = Motomakes.find(:all, :order => 'sort_order ASC')
				elsif @listing.listingtype == "marine"
					@marinecategories = Marinecategories.find(:all, :order => 'category ASC', :select => 'distinct category')
					@marinesubcategories = Marinecategories.find_all_by_category(@listing.category, :order => "subcategory ASC").map{|m| [m.subcategory, m.subcategory]}
					@marinemakes = Marinemakes.find(:all, :order => 'make ASC')
				elsif @listing.listingtype == "power"
					@powercategories = Powercategories.find(:all, :order => 'category ASC', :select => 'distinct category')
					@powersubcategories = Powercategories.find_all_by_category(@listing.category, :order => "subcategory ASC").map{|m| [m.subcategory, m.subcategory]}
					@powermakes = Powermakes.find(:all, :order => 'sort_order ASC')
				end
				
				@photo = @listing.photos.new(params[:photo])
				@photo_count = @listing.photos.count
			#end
		else
			redirect_to @listing
		end
  end

  # POST /listings
  # POST /listings.xml
  def create
		@user = current_user
    @listing = @user.listings.new(params[:listing])

    respond_to do |format|
      if @listing.save
        flash[:notice] = 'Listing was successfully created.'
        format.html { redirect_to edit_user_listing_path(@user, @listing) }
        format.xml  { render :xml => @listing, :status => :created, :location => @listing }
      else
      	flash[:notice] = @listing.errors.full_messages * "<br />"
        format.html { redirect_to :back }
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
        format.html { redirect_to wishlists_path }
        format.xml  { head :ok }
      else
      	flash[:notice] = @listing.errors.full_messages * "<br />"
        format.html { redirect_to :back }
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
      format.html { redirect_to(:back) }
      format.xml  { head :ok }
    end
  end
  #def recent
  #  @listings = Listing.all(:order => "created_at DESC", :limit => 4)
  #  
	#	render :partial => "recent"
  #end

  private

  def listing_params
    params.require(:listing).permit(:listingtype, :expired_at, :year, :mileage, :make, :vin, :model, :price, :body, :desc, :exterior_color,
                                    :interior_color, :doors, :engine, :transmission, :drive, :fuel, :category, :subcategory, :length, :hull)
  end
end
