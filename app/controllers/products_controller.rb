class ProductsController < ApplicationController  
  def index
    @products = Product.get_products_with_ad_sku
    render json: @products
  end
  
  def import
  end
end

