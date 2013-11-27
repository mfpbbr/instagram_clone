require 'factory_girl_rails'

FactoryGirl.define do
  
  factory :photo do
    image { Rails.root.join("public/images/unknown.jpg").open }
    user
  end

  factory :photo2 do
    image { Rails.root.join("public/images/unknown.jpg").open }
    user
  end

end
