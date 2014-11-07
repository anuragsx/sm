class PowermakesController < ApplicationController

	def index
  	
    respond_to do |format|
    	@user = current_user
    	if @user
    		if @user.admin
	    		@powermakes = Powermakes.find(:all, :order => 'sort_order ASC')
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
	    		@powermake = Powermakes.new
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
    @powermake = Powermakes.new(params[:powermakes])

    respond_to do |format|
      if @powermake.save
        flash[:notice] = 'Power Make was successfully created.'
        format.html { redirect_to :back }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def destroy
    @powermake = Powermakes.find(params[:id])
    @powermake.destroy

    respond_to do |format|
    	flash[:notice] = 'Power Make was successfully removed.'
      format.html { redirect_to(powermakes_path) }
    end
  end
end
