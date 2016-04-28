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

  end

  def create

  end

  def destroy
    product = Product.find(params[:id]).destroy

    redirect_to vendor_path(params[:vendor_id])
  end

  private

  def product_update_params
    params.permit(product: [:name])
  end
end
