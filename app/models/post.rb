class Post < ApplicationRecord
  validates :image, :couponcode, :shopname, :address, :expirydate, presence: true
  belongs_to :user

  mount_uploader :image, ImageUploader
end
