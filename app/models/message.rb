class Message < ApplicationRecord
  validates :text_or_image,presence: true

  belongs_to :sales,class_name: 'User',foreign_key: 'sales_id'
  belongs_to :customer,class_name: 'User',foreign_key: 'customer_id'
  belongs_to :event,optional: true
  belongs_to :car

  mount_uploader :image, ImageUploader

  private

  def text_or_image
    text.presence or image.presence
  end
end
