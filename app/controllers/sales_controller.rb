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
#I HATE THIS IT IS THE WORST:
    params[:sale][:amount] = params[:sale][:amount].to_s.gsub(/\./, '')
#END OF HATE
    @sale = Sale.new(new_sale_create_params[:sale])
    if @sale.save
      @sale[:sale_id] = @sale[:id]
      @sale.save
      redirect_to product_path(@sale.vendor_id)
    else
      render :new
    end
  end

  private

  def new_sale_create_params
    params.permit(sale: [:sale_id, :amount, :vendor_id, :product_id])
  end
end
