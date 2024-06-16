class ProductsController < ApplicationController
    before_action :set_product, only: %i[show edit update destroy add_to_cart]
    before_action :authenticate_user!, only: %i[add_to_cart]
    before_action :authenticate_admin!, only: %i[new create edit update destroy]
  
    def index
      @products = Product.all
    end
  
    def show
    end
  
    def new
      @product = Product.new
    end
  
    def edit
    end
  
    def create
      @product = Product.new(product_params)
      if @product.save
        redirect_to @product, notice: 'Product was successfully created.'
      else
        render :new
      end
    end
  
    def update
      if @product.update(product_params)
        redirect_to @product, notice: 'Product was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @product.destroy
      redirect_to products_url, notice: 'Product was successfully destroyed.'
    end
  
    def add_to_cart
      current_user.cart.add(@product)
      redirect_to cart_path, notice: 'Product was successfully added to your cart.'
    end
  
    private
  
    def set_product
      @product = Product.find(params[:id])
    end
  
    def product_params
      params.require(:product).permit(:name, :description, :price)
    end
  
    def authenticate_admin!
      redirect_to root_path, alert: 'You are not authorized to perform this action.' unless current_user.admin?
    end
end
  