class ProductsController < ApplicationController

  def new
    @product = Product.new
    @vendor = Vendor.find(params["format"])
  end

  def create
    @product = Product.new(product_edit_params[:product])
    if @product.save
      redirect_to vendor_path(@product.vendor_id)
    else
      render :new
    end
  end

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
    params.permit(product: [:name, :vendor_id])
  end

end
