class Order < ApplicationRecord
    has_many :order_items, dependent: :destroy
    has_many :users, through: :order_items
    has_many :products, through: :order_items
end
