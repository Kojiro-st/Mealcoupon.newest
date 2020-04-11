class Post < ApplicationRecord
  validates :image, :couponcode, :shopname, :address, :expirydate, presence: true
  belongs_to :user
  acts_as_taggable

  mount_uploader :image, ImageUploader
  def self.search(search)
    return Post.all unless search
    Post.where('shopname LIKE(?)', "%#{search}%")
  end

  # geocoded_by :address
  # after_validation :geocode, if: :address_changed?

  # geocoded_by :address
  # after_validation :geocode, if: lambda {|obj| obj.address_changed?}

  geocoded_by :address, latitude: :lat, longitude: :lon

end
