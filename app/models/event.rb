class Event < ApplicationRecord
  with_options presence: true do
    validates :title
    validates :date
    validates :car_id
  end

  belongs_to :sales,class_name: 'User',foreign_key: 'sales_id'
  belongs_to :customer,class_name: 'User',foreign_key: 'customer_id'
  belongs_to :car
  has_many :messages,foreign_key: "event_id",dependent: :destroy
end
