class ProductsController < ApplicationController

	def index
    @vendor = Vendor.find(params[:vendor_id])
    @products = @vendor.products
  end

  def show
    @products = Product.find(params[:vendor_id])
  end

  def edit
    @product = Product.find(params[:product_id])
    
  end

  def update
    
  end

  def destroy
  	@product = Product.find(params[:id])
    @product.destroy
    redirect_to vendor_product_path
  end
end
