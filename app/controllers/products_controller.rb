class ProductsController < ApplicationController
    skip_before_action :authorized, only: [:index, :show]

    def create
        if @user.profile.is_admin
            product = Product.create(product_params)
           
            if product.valid?
                render json: product, status: :created
            else
                render json: {error: "Failed to create product"}
            end
        else
            render json: {error: "Only admin is authorized to do that!"}
        end
    end

    def index
        query = params[:new]
        products = query ? Product.all.order(created_at: :desc).limit(5) : Product.all

        if products
            render json: products, status: :ok
        else
            render_product_not_found_response
        end
    end

    def show
        product = find_product

        if product
            render json: product, status: :ok
        else
            render_product_not_found_response
        end
    end

    private

    def product_params
        params.permit(:title, :description, :image, :categories, :price, :in_stock)
    end

    def find_product
        Product.find_by(id: params[:id])
    end

    def render_product_not_found_response
        render json: {error: "Product is not available."}
    end
end
