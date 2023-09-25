class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: {
    customer: 0, admin: 1, default: 0
  }

  has_many :cart_items
  has_many :products, through: :cart_items
end
