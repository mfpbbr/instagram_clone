require 'factory_girl_rails'

FactoryGirl.define do
  
  factory :photo do
    image { Rails.root.join("public/images/unknown.jpg").open }
    caption "Awesome"
    tags "selfie yolo"
    user
  end

end
