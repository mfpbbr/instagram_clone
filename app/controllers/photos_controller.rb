class PhotosController < ApplicationController
	before_filter :find_photo, only: [:edit, :update, :destroy]
	before_action :authenticate_user!, except: :index

	def index
		@photos = Photo.all
	end

	def new
		@photo = Photo.new
	end

	def create
		@photo = current_user.photos.build(photo_params)
		@photo.tags = params[:photo][:tag_list].split(' ').map do |text|
	  		Tag.find_or_create_by(text: text)
	  	end
		if @photo.save
			WebsocketRails[:photos].trigger 'new', {caption: @photo.caption, image_url: @photo.image.url(:medium), tags: @photo.tags, user: @photo.user }
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
			params[:photo].permit(:image, :caption)
		end

		def find_photo
			@photo = Photo.find(params[:id])
		end
		
end
