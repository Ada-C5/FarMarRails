class ProductsController < ApplicationController
  def index
    @products = Product.where(vendor_id: params[:vendor_id]).order(name: :asc)
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_param[:product])
    @product.vendor_id = (params[:vendor_id])
      if @product.save
        redirect_to vendors_path
      else
        render :new
      end
  end

  def edit
    # @vendor = Vendor.find(params[:vendor_id])
    @product = Product.find(params[:id])
    render :edit
  end

  def update
    Product.update(params[:id], products_params[:product])
    redirect_to products_path
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to vendors_path
  end


private

  def product_param
    params.permit(product: [:name])
  end
end
