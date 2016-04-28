class SalesController < ApplicationController
  def index
    @vendor = Vendor.find(params[:id])
    @sales = @vendor.sales
    @sum = Sale.where(vendor_id: params[:id]).sum(:amount)
    @sales_this_month = Sale.sales_this_month(Time.now.strftime("%m"), params[:id])
  end
end
