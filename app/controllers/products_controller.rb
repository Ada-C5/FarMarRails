class ProductsController < ApplicationController
  def index
    @products = Product.all.find(params[:vendor_id]) 
    render :show
  end


  def show
    @products = Product.all.where(params[:vendor_id])
  end
end
