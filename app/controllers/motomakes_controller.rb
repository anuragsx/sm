class MotomakesController < ApplicationController

	def index
  	
    respond_to do |format|
    	@user = current_user
    	if @user
    		if @user.admin
	    		@motomakes = Motomakes.find(:all, :order => 'sort_order ASC')
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
	    		@motomake = Motomakes.new
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
    @motomake = Motomakes.new(params[:motomakes])

    respond_to do |format|
      if @motomake.save
        flash[:notice] = 'Moto Make was successfully created.'
        format.html { redirect_to :back }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def destroy
    @motomake = Motomakes.find(params[:id])
    @motomake.destroy

    respond_to do |format|
    	flash[:notice] = 'Moto Make was successfully removed.'
      format.html { redirect_to(motomakes_path) }
    end
  end
end
