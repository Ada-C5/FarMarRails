class SalesController < ApplicationController
  def index
    @vendor = Vendor.find(params[:id])
    @sales = @vendor.sales
    @sum = Sale.where(vendor_id: params[:id]).sum(:amount)
    @sales_this_month = Sale.sales_this_month(params[:month], params[:id])
  end

  def new
    # three objects that we are concerned with: vendor, product and sales
    @sale = Sale.new
    vendor = Vendor.find(params[:id])
    @products = vendor.products
  end

  def create
    @sale = Sale.new(sales_params[:sale])
    @sale.vendor_id = (params[:vendor_id])
    @sale.purchase_time = Time.now
    if @sale.save
      redirect_to sales_path
    else
      render :new
    end
  end

  private

  def sales_params
    params.permit(sale: [:amount, :product_id])
  end


end
