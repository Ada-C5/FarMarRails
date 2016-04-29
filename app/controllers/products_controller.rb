class ProductsController < ApplicationController

  def show
    @product = Product.find(params[:p_id])
    render :single_product
  end


  def new
    @product = Product.new
    @vendor = Vendor.find(params[:id])
  end

  def create
    @product = Product.create(product_create_params[:product])
    redirect_to vendor_products_path
  end

  def destroy
  Product.find(params[:p_id]).destroy
  redirect_to vendor_products_path #redirect does not remember instance variables
end

  private

  def product_create_params
  params.permit(product: [:product_number, :name, :vendor_number])
    #how to be sure the product number is unique from those in db?
  end

end
