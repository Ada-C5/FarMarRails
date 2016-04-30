class ProductsController < ApplicationController

  def new
    @vendor = Vendor.find(params[:vendor_id])
    @product = Product.new
  end

  def create
    @vendor = Vendor.find(params[:vendor_id])
    @product = Product.new(create_product_params[:product])
    if @product.save
      @product.update(vendor_id: params[:vendor_id])
      redirect_to vendor_path(params[:vendor_id])
    else
      render :new
    end
  end

  def edit
    @vendor = Product.find(params[:id]).vendor
    @product = Product.find(params[:id])
    render :new
  end

  def update
    @product = Product.find(params[:id])
    @product.update(update_product_params[:product])
    if @product.save
      redirect_to vendor_path(params[:vendor_id])
    else
      render :new
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to vendor_path(params[:vendor_id])
  end

  private
  def create_product_params
    params.permit(product: [:name])
  end

  def update_product_params
    params.permit(product: [:name])
  end

end
