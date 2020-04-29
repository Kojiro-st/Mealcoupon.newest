class Message < ApplicationRecord
  belongs_to :post

  validates :name, :phonenumber, :ordertimeleft, :ordertimeright, :howtoeat, :people, presence: true
end
