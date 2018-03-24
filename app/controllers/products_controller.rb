class ProductsController < ApplicationController  
  def index
    @products = Product.get_product_data
    render json: @products
  end
  
  def import
  end
end

