module PhotosHelper

	def like_button(photo)
		button_to photo_likes_path(photo)
	end

end
