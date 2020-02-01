class Car < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :image
    validates :inspection_date
    validates :model_year
    validates :distance
  end

  belongs_to :user
  has_many :events,dependent: :destroy
  has_many :cars

  mount_uploader :image, ImageUploader
end
