class ProductsController < ApplicationController

	def index
    @vendor = Vendor.find(params[:vendor_id])
    @products = @vendor.products
  end

  def show
    @products = Product.find(params[:vendor_id])
  end

  def new
    @vendor = Vendor.find(params[:vendor_id])
    @product = @vendor.products.new
		raise
  end

  def create
    # @vendor = Vendor.find(params[:vendor_id])
    # raise
    Product.create(product_create_params[:product])
      redirect_to vendor_products_path(params[:vendor_id])
  end

  def edit
    @product = Product.find(params[:id])
    @vendor = Vendor.find(params[:vendor_id])
  end

  def update
    @product = Product.find(params[:id])
    @product.update_attributes(product_update_params[:product])
    redirect_to vendor_products_path
  end

  def destroy
  	@product = Product.find(params[:id])
    @product.destroy
    redirect_to vendor_products_path
  end

  private
  def product_create_params
    params.permit(product: [:name, :vendor_id])
  end

  def product_update_params
    params.permit(product: [:name])
  end

end
