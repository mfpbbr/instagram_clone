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
	$image.find('.like_count').text 'Likes: 0'
	$image.find('.like_button form').attr('action', '/photos/'+photo.id+'/likes')
	$image.find('img').attr 'src', photo.image_url

	$('.photos').append $image


$(document).ready ->
	$('.map').each ->
		$map = $(this)
		photo_id = $map.data('id')
		$.get "http://localhost:3000/api/photos/#{photo_id}", (photo) ->
			map = new GMaps
			  div: '#' + $map[0].id
			  lat: photo.latitude
			  lng: photo.longitude
			map.addMarker
			  lat: photo.latitude
			  lng: photo.longitude
				
			  
             
             
 

