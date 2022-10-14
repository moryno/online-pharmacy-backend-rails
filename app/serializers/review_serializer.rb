class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :title, :created_at
  has_one :user
  has_one :product
end
