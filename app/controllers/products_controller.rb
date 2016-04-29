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

  def edit
    @product = Product.find(params[:id])
    render :edit
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_update_params[:product])
    redirect_to vendor_path(params[:vendor_id])
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    redirect_to vendor_path(params[:vendor_id])
  end

  private

  def product_create_params
    params.permit(product: [:name])
  end

  def product_update_params
    params.permit(product: [:name])
  end
end
