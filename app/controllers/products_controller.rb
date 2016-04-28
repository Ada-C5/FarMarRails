class ProductsController < ApplicationController
  def edit
    @vendor = Product.find(params[:id]).vendor
    @product = Product.find(params[:id])
    render :new
  end

  def new
    @vendor = Vendor.find(params[:vendor_id])
    @product = Product.new
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to vendor_path(params[:vendor_id])
  end

  private
  def create_product_params
    params.permit(:id)
  end

end
