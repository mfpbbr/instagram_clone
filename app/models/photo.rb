class Photo < ActiveRecord::Base
  has_attached_file :image, styles: { medium: "300x300>" }, default_url: "/images/:style/missing.png"
  belongs_to :user
  validates :user, presence: true
  validates :image, attachment_presence: { message: 'need a photo' }
end


# AKIAIBILV4OZ3SMFCFXQ
# X7WpNVGvU24/ezA86Be7txdRb/Oad9MOyzuU6L4H