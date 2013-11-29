# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

connection = new WebSocketRails('localhost:3000/websocket')

channel = connection.subscribe('photos')
channel.bind 'new', (photo) ->
	$image = $('.insta_image:last').clone()

	$image.find('.caption').text photo.caption
	tags_array = []
	photo.tags.forEach (tag) ->
		tags_array.push('<a href="/tags/'+tag.id+'">'+tag.text+'</a>')
	$image.find('.tags').html tags_array.toString()
	$image.find('.user').text photo.user.email
	$image.find('img').attr 'src', photo.image_url

	$('.photos').append $image