class MarinemakesController < ApplicationController

	def index
  	
    respond_to do |format|
    	@user = current_user
    	if @user
    		if @user.admin
	    		@marinemakes = Marinemakes.find(:all, :order => 'make ASC')
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
	    		@marinemake = Marinemakes.new
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
    @marinemake = Marinemakes.new(params[:marinemakes])

    respond_to do |format|
      if @marinemake.save
        flash[:notice] = 'Marine Make was successfully created.'
        format.html { redirect_to :back }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def destroy
    @marinemake = Marinemakes.find(params[:id])
    @marinemake.destroy

    respond_to do |format|
    	flash[:notice] = 'Marine Make was successfully removed.'
      format.html { redirect_to(marinemakes_path) }
    end
  end
end
