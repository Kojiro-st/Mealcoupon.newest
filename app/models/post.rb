class Post < ApplicationRecord
  validates :text, :image, presence: true
end
