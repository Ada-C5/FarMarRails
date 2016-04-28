class ProductsController < ApplicationController
  def edit

  end

  def update

  end

  def new

  end

  def create

  end

  def destroy
    product = Product.find(params[:id]).destroy

    redirect_to vendor_path(params[:vendor_id])
  end
end
