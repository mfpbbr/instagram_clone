require 'factory_girl_rails'

FactoryGirl.define do
	factory :photo_list, class: Photo do
		image { Rails.root.join("public/images/unknown.jpg").open }
		caption "Photo"
		tags { [Tag.create(text: '#yolo'), Tag.create(text: '#blah')] }
		user { User.create(email: 'jack@hello.com', password: '12345678', password_confirmation: '12345678')}
	end
end