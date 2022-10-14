class ProductsSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :image, :categories, :price, :in_stock
end
