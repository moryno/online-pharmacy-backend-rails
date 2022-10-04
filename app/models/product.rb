class Product < ApplicationRecord
    attribute :in_stock, default: true
    
    validates :title, presence: true, uniqueness: true
    validates :description, presence: true
    validates :image, presence: true
    validates :price, presence: true
end
