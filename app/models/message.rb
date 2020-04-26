class Message < ApplicationRecord
  belongs_to :user

  validates :name, :phonenumber, :ordertimeleft, :ordertimeright, :howtoeat, :people, presence: true
end
