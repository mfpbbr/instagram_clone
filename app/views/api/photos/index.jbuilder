json.array! @photos do |photo|
  json.(photo, :id, :caption, :tags, :user)
  json.url photo_url(photo)
end