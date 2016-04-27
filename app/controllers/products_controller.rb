class ProductsController < ApplicationController

  def show
    @products = Product.where(vendor_id: params[:id])
    render :index
  end

  def new
    @new_product = Product.new
    render :new
  end

  def create
    @new_product = Product.new(new_product_create_params[:product])
    if @new_product.save
      redirect_to root_path
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
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @product = Product.destroy(params[:id])
    redirect_to root_path
  end

  private

  def new_product_create_params
    params.permit(product: [:product_id, :product_name, :vendor_id]) #you must permit parameters when you want to allow access to the user to create new data using the params. The user is ONLY permitted to access the artist and title parameters.
  end
end
