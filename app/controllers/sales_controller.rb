class SalesController < ApplicationController

  def index
    @params = params[:vendor_id]
    @vendor = Vendor.find(params[:vendor_id])
    @sales = @vendor.sales
  end

  def show
    @sale = Sale.find(params[:sale_id])
  end

  def new
    @vendor = Vendor.find(params[:vendor_id])
    @sale = Sale.new
  end

  def create
    @vendor = Vendor.where(id: params.fetch(:vendor_id)).first
    @sale = Sale.find_or_create_by(sales_params)
    if @vendor
      redirect_to vendor_sales_path(@vendor.id)
    else
      render :new
    end
  end


  def load_vendor
    @vendor = Vendor.find(params[:vendor_id])
  end


  def sales_params
    params.require(:sale).permit(:amount, :product_id, :vendor_id, :purchase_time)
  end
end
