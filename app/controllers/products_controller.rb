class ProductsController < ApplicationController

  def new
    @product = Product.new
    @all_vendors = Vendor.all
    render :new
  end

  def create
    @product = Product.create(product_create_params[:product])
    redirect_to vendor_path(@product.vendor_id)
  end

  private

  def product_create_params
    params.permit(product: [:name, :vendor_id])
  end
end
