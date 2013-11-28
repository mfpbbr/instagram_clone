# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

connection = new WebSocketRails('localhost:3000/websocket')

# // subscribe to the channel
# // bind to a channel event
channel = connection.subscribe('photos')
channel.bind 'new', (photo) ->
	$image = $('.insta_image:last').clone()

	$image.find('.caption').text photo.caption
	# $tags_array = []
	# for tag in photo.tags
	# 	$tags_array.push('<a href="'+tags[i].href+'">'+tags[i].text+'</a>')
	$image.find('.tags').html photo.tags.toString
	$image.find('.user').text photo.user.email
	$image.find('img').attr 'src', photo.image_url

	$('.photos').append $image


