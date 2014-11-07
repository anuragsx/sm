class MotocategoriesController < ApplicationController

	def index
  	
    respond_to do |format|
    	@user = current_user
    	if @user
    		if @user.admin
	    		@motocategories = Motocategories.find(:all, :order => 'category ASC')
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
	    		@motocategory = Motocategories.new
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
    @motocategory = Motocategories.new(params[:motocategories])

    respond_to do |format|
      if @motocategory.save
        flash[:notice] = 'Moto Category was successfully created.'
        format.html { redirect_to :back }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def destroy
    @motocategory = Motocategories.find(params[:id])
    @motocategory.destroy

    respond_to do |format|
    	flash[:notice] = 'Moto Category was successfully removed.'
      format.html { redirect_to(motocategories_path) }
    end
  end
end
