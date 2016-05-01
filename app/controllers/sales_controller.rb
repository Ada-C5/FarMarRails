
class SalesController < ApplicationController

  def index
    @sales = Sale.all
  end

  def new
    @sale = Sale.new
    @vendor = Vendor.find(params["format"])
    @products = @vendor.products

  end

  def create
    @sale = Sale.new(sale_create_params[:sale])
    @sale.purchase_time = Chronic.parse(@sale.purchase_time.to_s)
    # redirect_to root_path
      if @sale.save
        redirect_to vendor_path(@sale.vendor_id)
      else
        @vendor = @sale.vendor
        @products = @vendor.products
        render :new
      end
  end

  def destroy
    @sale = Sale.find(params[:id])
    if @sale.destroy
      redirect_to vendor_path(@sale.vendor_id)
    else
      flash.now[:alert] = 'Sale could not be deleted.'
    end
  end

  private
  def sale_create_params
  params.permit(sale: [:amount, :purchase_time, :vendor_id, :product_id])
  end

end
