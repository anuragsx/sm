class AutocategoriesController < ApplicationController

  layout :application

	def index
  	
    respond_to do |format|
    	@user = current_user
    	if @user
    		if @user.admin
	    		@autocategories = Autocategories.find(:all, :order => 'category ASC')
		      format.html # index.html.erb
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

  def new

    respond_to do |format|
    	@user = current_user
    	if @user
    		if @user.admin
	    		@autocategory = Autocategories.new
		      format.html # new.html.erb
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

  def create
    @autocategory = Autocategories.new(params[:autocategories])

    respond_to do |format|
      if @autocategory.save
        flash[:notice] = 'Auto Category was successfully created.'
        format.html { redirect_to :back }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def destroy
    @autocategory = Autocategories.find(params[:id])
    @autocategory.destroy

    respond_to do |format|
    	flash[:notice] = 'Auto Category was successfully removed.'
      format.html { redirect_to(autocategories_path) }
    end
  end

  private

  def autocategory_params
    params.require(:autocategory).permit(:category)
  end
end
