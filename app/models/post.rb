class Post < ApplicationRecord
  validates :text, :image, presence: true
  belongs_to :user
end
