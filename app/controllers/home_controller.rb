class HomeController < ApplicationController
	layout "homepage"
	
	def index
		@photo = Photo.new
	end

end
