class ProductsController < ApplicationController

  def new
    @product = Product.new
    render :new
  end

  def create
    @product = Product.new(product_create_params[:product])
    @product.vendor_id = params[:vendor_id]
    if(@product.save)
      redirect_to vendor_path(params[:vendor_id])
    else
      render :new
    end
  end

  private

  def product_create_params
    params.permit(product: [:name])
  end
end
