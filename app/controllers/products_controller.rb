class ProductsController < ApplicationController

	def index
    @vendor = Vendor.find(params[:vendor_id])
    @products = @vendor.products
  end

  def show
    @product = Product.find(params[:product_id])
  end

  def delete
  	@product = Product.find(params[:product_id]).destroy
  end
end
