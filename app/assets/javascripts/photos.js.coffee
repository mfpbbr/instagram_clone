# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

connection = new WebsocketRails('localhost:3000/websocket')

# // subscribe to the channel
# // bind to a channel event
channel = connection.subscribe('photos')
channel.bind 'new', (data) ->
	alert('Hello')
