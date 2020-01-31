class Car < ApplicationRecord
  belongs_to :user
  has_many :events,dependent: :destroy
  has_many :cars
end
