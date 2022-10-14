class ProductShowReviewsSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :image, :categories, :price, :in_stock
  has_many :reviews
end
