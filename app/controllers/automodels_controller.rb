class AutomodelsController < ApplicationController

	def index
  	
    respond_to do |format|
    	@user = current_user
    	if @user
    		if @user.admin
	    		@automodels = Automodels.find(:all, :order => 'make ASC, model ASC')
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
	    		@automodel = Automodels.new
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
    @automodel = Automodels.new(params[:automodels])

    respond_to do |format|
      if @automodel.save
        flash[:notice] = 'Auto Make/Model was successfully created.'
        format.html { redirect_to :back }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def destroy
    @automodel = Automodels.find(params[:id])
    @automodel.destroy

    respond_to do |format|
    	flash[:notice] = 'Auto Make/Model was successfully removed.'
      format.html { redirect_to(automodels_path) }
    end
  end
end
