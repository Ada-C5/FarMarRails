class ProductsController < ApplicationController
  def edit
    @vendor = Product.find(params[:id]).vendor
    @product = Product.find(params[:id])
    render :new
  end

  def new
    @product = Product.new
  end

  private
  def create_product_params
    params.permit(:id)
  end

end
