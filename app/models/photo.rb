class Photo < ActiveRecord::Base
  has_attached_file :image, styles: { large: "600x600>", medium: "300x300>", thumb: "150x150>" }, default_url: "/images/:style/missing.png"
  
  belongs_to :user
  has_and_belongs_to_many :tags

  validates :user, presence: true
  validates :image, attachment_presence: { message: 'need a photo' }

  def tag_list
  	tags.map(&:text).join ' '
  end

  # validates :tags, format: { with: /\A(\#(\w)*(\W)?)*\z/, message: "has to have a Hashtag (/#)" }
end
