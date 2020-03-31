class Post < ApplicationRecord
  validates :image, :couponcode, :shopname, :address, :expirydate, presence: true
  belongs_to :user

  mount_uploader :image, ImageUploader
  def self.search(search)
    return Post.all unless search
    Post.where('shopname LIKE(?)', "%#{search}%")
  end

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

end
