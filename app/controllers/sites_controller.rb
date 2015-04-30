class SitesController < ApplicationController
    before_filter :index
	before_action :set_site, only: [:destroy]
	def index
	  @sites = Site.all	
	  @site = Site.new		
	end

	def new
		@site = Site.new
	end

	def create
		@site = Site.create(site_params)
		redirect_to sites_path, notice: "Site added successfully"
	end

	def destroy
        @site.destroy
        redirect_to sites_path, notice: "Site deleted successfully"
	end


	private

	def site_params
		params.require(:site).permit(:name)
	end

	def set_site
		@site = Site.find(params[:id])
	end

end
