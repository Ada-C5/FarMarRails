class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def destroy
    @product = Product.find(params[:id])
    if @product.destroy
      redirect_to vendor_path(@product.vendor_id)
    else
      flash.now[:alert] = 'Product could not be deleted.'
    end
  end

  def edit
  end

  def update
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_edit_params[:product])
      redirect_to vendor_path(@product.vendor_id)
    else
      render :edit
    end
  end

  private

  def product_edit_params
    params.permit(product: [:name])
  end

end
