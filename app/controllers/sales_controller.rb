class SalesController < ApplicationController

  # def show
  #   @products = Product.where(vendor_id: params[:id]).order(product_name: :asc)
  #   render :index
  # end

  def new
    @sale = Sale.new
    @product = Product.find(params[:id])
    @vendor = Vendor.find(@product.vendor_id)
    render :new
  end

  def create
    @sale = Sale.new(new_product_create_params[:sale])
    if @sale.save
      @sale[:sale_id] = @sale[:id]
      @sale[:product_id] = @product[:id]
      @sale[:vendor_id] = @vendor[:id]
      @sale.save
      redirect_to product_path(@product.vendor_id)
    else
      render :new
    end
  end

  # def edit
  #   @product = Product.find(params[:id])
  #   render :edit
  # end
  #
  # def update
  #   @product = Product.find(params[:id])
  #   if @product.update(new_product_create_params[:product])
  #     redirect_to product_path(@product.vendor_id)
  #   else
  #     render :edit
  #   end
  # end
  #
  # def destroy
  #   @product = Product.destroy(params[:id])
  #   redirect_to product_path(@product.vendor_id)
  # end

  private

  def new_sale_create_params
    params.permit(sale: [:sale_id, :amount, :vendor_id, :product_id]) #you must permit parameters when you want to allow access to the user to create new data using the params. The user is ONLY permitted to access the artist and title parameters.
  end
end
