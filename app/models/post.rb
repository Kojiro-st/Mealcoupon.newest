class Post < ApplicationRecord
  validates :image, :couponcode, :shopname, :address, :expirydate, presence: true
  belongs_to :user
end
