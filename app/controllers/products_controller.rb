class ProductsController < ApplicationController

    def create
        if @user.profile.is_admin
            product = Product.create(product_params)
           
            if product.valid?
                render json: product, status: :created
            else
                render json: {error: "Failed to create user"}
            end
        else
            render json: {error: "Only admin is authorized to do that!"}
        end
    end

    private

    def product_params
        params.permit(:title, :description, :image, :categories, :price, :in_stock)
    end
end
