class Product < ApplicationRecord

    has_many :cart_items, dependent: :destroy
    has_many :purchases, dependent: :destroy
    has_many :users, through: :cart_items


    validates :name, presence: true
    validates :description, presence: true
end
