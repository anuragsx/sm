class PhotosController < ApplicationController
  # GET /photos
  # GET /photos.xml
  def index
  	@user = current_user
  	@listing = Listing.find(params[:listing_id])
    @photos = @listing.photos

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @photos }
    end
  end

  # GET /photos/1
  # GET /photos/1.xml
  def show
  	@listing = Listing.find(params[:listing_id])
    @photo = @listing.photos.find(params[:id])

    respond_to do |format|
    	format.jpg #this will call the show.jpg.flexi file to display the photo
      format.html # show.html.erb
      format.xml  { render :xml => @photo }
    end
  end

  # GET /photos/new
  # GET /photos/new.xml
  def new
    @listing = Listing.find(params[:listing_id])
    @photo = @listing.photos.new(params[:photo])

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @photo }
    end
  end

  # GET /photos/1/edit
  def edit
  	@listing = Listing.find(params[:listing_id])
    @photo = @listing.photos.find(params[:id])
  end

  # POST /photos
  # POST /photos.xml
  def create
  	@user = current_user
  	@listing = Listing.find(params[:listing_id])
    @photo = @listing.photos.new(params[:photo])

    respond_to do |format|
      if @photo.save
        flash[:notice] = 'Photo was successfully uploaded.'
        format.html { redirect_to edit_user_listing_path(@user, @listing) }
        format.xml  { render :xml => @photo, :status => :created, :location => @photo }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @photo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /photos/1
  # PUT /photos/1.xml
  def update
    @listing = Listing.find(params[:listing_id])
    @photo = @listing.photos.find(params[:id])

    respond_to do |format|
      if @photo.update_attributes(params[:photo])
        flash[:notice] = 'Photo was successfully updated.'
        format.html { redirect_to listing_photo_url(@listing, @photo) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @photo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.xml
  def destroy
    @listing = Listing.find(params[:listing_id])
    @photo = @listing.photos.find(params[:id])
    @photo.destroy

    respond_to do |format|
	    flash[:notice] = 'Photo was successfully deleted.'
      format.html { redirect_to listing_photos_path(@listing) }
      format.xml  { head :ok }
    end
  end
#Messing around with displaying different image sizes...
  def showlarge
    @photo = Photo.find(params[:id])

    respond_to do |format|
    	format.jpg #this will call the showlarge.jpg.flexi file to display the photo
      format.html # show.html.erb
      format.xml  { render :xml => @photo }
    end
  end
  
  def showmedium
    @photo = Photo.find(params[:id])

    respond_to do |format|
    	format.jpg #this will call the showmedium.jpg.flexi file to display the photo
      format.html # show.html.erb
      format.xml  { render :xml => @photo }
    end
  end
  
  def showsmall
    @photo = Photo.find(params[:id])

    respond_to do |format|
    	format.jpg #this will call the showsmall.jpg.flexi file to display the photo
      format.html # show.html.erb
      format.xml  { render :xml => @photo }
    end
  end
#End of messing around with image sizes
end
