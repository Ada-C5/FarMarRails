class ProductsController < ApplicationController
  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_update_params[:product])

    redirect_to edit_vendor_product_path
  end

  def new
    @vendor = Vendor.find(params[:vendor_id])
    @product = @vendor.products.new
  end

  def create
    if Product.create(product_create_params[:product])
      redirect_to vendor_path(params[:vendor_id])
    else
      redirect_to new_vendor_product_path(params[:vendor_id])
    end
  end

  def destroy
    product = Product.find(params[:id]).destroy

    redirect_to vendor_path(params[:vendor_id])
  end

  private

  def product_update_params
    params.permit(product: [:name])
  end

  def product_create_params
    params.permit(product: [:name, :vendor_id])
  end
end
