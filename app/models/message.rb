class Message < ApplicationRecord
  belongs_to :user

  validates :name, :phonenumber, :ordertime, :howtieat, :people, presence: true
end
