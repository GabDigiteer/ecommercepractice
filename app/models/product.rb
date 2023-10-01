class Product < ApplicationRecord

    has_many :cart_items
    has_many :users, through: :cart_items

    validates :name, presence: true
    validates :description, presence: true
end
