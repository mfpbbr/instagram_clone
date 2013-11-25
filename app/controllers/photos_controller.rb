class PhotosController < ApplicationController
	before_filter :find_photo, only: [:edit, :update, :destroy]

	def index
		@photos = Photo.all
	end

	def new
		@photo = Photo.new
	end

	def create
		@photo = Photo.new(photo_params)
		if @photo.save
			redirect_to '/photos'
		else
			render 'new'
		end
	end

	def edit

	end

	def update 
	  if @photo.update(photo_params)
	    redirect_to '/photos'
	  else
	    render 'edit'
	  end
	end

	def destroy	  
		@photo.destroy
	 
	  redirect_to photos_path
	end

	private
		def photo_params
			params[:photo].permit(:image, :caption, :tags)
		end

		def find_photo
			@photo = Photo.find(params[:id])
		end

end
