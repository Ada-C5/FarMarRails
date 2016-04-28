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

end
