class ProductsController < ApplicationController

  def show
    @products = Product.where(vendor_id: params[:id]).order(product_name: :asc)
    render :index
  end

  def new
    @product = Product.new
    @vendor = Vendor.find(params[:id])
    render :new
  end

  def create
    @product = Product.new(new_product_create_params[:product])
    if @product.save
      @product[:product_id] = @product[:id]
      @product.save
      redirect_to product_path(@product.vendor_id)
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
    if @product.update(new_product_create_params[:product])
      redirect_to product_path(@product.vendor_id)
    else
      render :edit
    end
  end

  def destroy
    @product = Product.destroy(params[:id])
    redirect_to product_path(@product.vendor_id)
  end

  private

  def new_product_create_params
    params.permit(product: [:product_id, :product_name, :vendor_id]) #you must permit parameters when you want to allow access to the user to create new data using the params. The user is ONLY permitted to access the artist and title parameters.
  end
end
