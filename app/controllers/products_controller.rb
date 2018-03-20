class ProductsController < ApplicationController
  def index
    @products = Product.all
    render json: @products
  end
  
  def import
    file = params[:file]
    
    Product.import(file)
  end
end
