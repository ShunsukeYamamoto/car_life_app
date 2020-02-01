class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cars,dependent: :destroy
  has_many :sales_events,class_name: 'Event', foreign_key: 'sales_id'
  has_many :customer_events,class_name: 'Event', foreign_key: 'customer_id'
  has_many :sales_messages,class_name: 'Message',foreign_key: 'sales_id'
  has_many :customer_messages,class_name: 'Message',foreign_key: 'customer_id'
end
