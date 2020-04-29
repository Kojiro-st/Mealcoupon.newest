class Post < ApplicationRecord
  validates :shopname, :address, :expirydate, :foodname, presence: true
  belongs_to :user, optional: true
  has_many :messages

  mount_uploader :image, ImageUploader

  geocoded_by :address, latitude: :lat, longitude: :lon

end
