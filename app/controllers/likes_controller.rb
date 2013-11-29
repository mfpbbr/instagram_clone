class LikesController < ApplicationController

	def create
		@photo = Photo.find(params[:photo_id])
		@photo.likes.create(photo_id: params[:photo_id], user_id: current_user.id)
		redirect_to '/'
	end

	def destroy
		photo = Photo.find(params[:photo_id])
		current_user.like(photo).destroy
		redirect_to('/')
	end
	
end
