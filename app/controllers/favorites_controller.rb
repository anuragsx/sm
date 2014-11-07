class FavoritesController < ApplicationController
  # GET /favorites
  # GET /favorites.xml
  def index
  	@user = current_user
  	if @user
	    @favorites = @user.favorites.find(:all, :include => {:listing => :photos})
	  end
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @favorites }
    end
  end

  # GET /favorites/1
  # GET /favorites/1.xml
#  def show
#    @favorite = Favorite.find(params[:id])
#
#    respond_to do |format|
#      format.html # show.html.erb
#      format.xml  { render :xml => @favorite }
#    end
#  end

  # GET /favorites/new
  # GET /favorites/new.xml
  def new
    @favorite = Favorite.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @favorite }
    end
  end

  # POST /favorites
  # POST /favorites.xml
  def create
    @favorite = Favorite.new(params[:favorite])

    respond_to do |format|
      if @favorite.save
        flash[:notice] = 'Favorite was successfully created.'
        format.html { redirect_to :back }
        format.xml  { render :xml => @favorite, :status => :created, :location => @favorite }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @favorite.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /favorites/1
  # DELETE /favorites/1.xml
  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy

    respond_to do |format|
    	flash[:notice] = 'Favorite was successfully removed.'
      format.html { redirect_to(favorites_path) }
      format.xml  { head :ok }
    end
  end
end
