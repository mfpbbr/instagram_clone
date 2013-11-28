class Tag < ActiveRecord::Base
  has_and_belongs_to_many :photos
  validates :text, format: { with: /\A#/, message: "has to have a Hashtag (/#)" }

end