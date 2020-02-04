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

  def self.search(search,sales)
    users = User.where(sales_id: sales.id).limit(5)
    return users unless search
    users.where('name LIKE(?)',"%#{search}%")
  end

  def self.search_person(keyword)
    User.where('name LIKE(?)',"%#{keyword}%").limit(1)
  end
  
end
