class SalesController < ApplicationController
  def index
    @vendor = Vendor.find(params[:id])
    @sales = @vendor.sales
    @sum = Sale.where(vendor_id: params[:id]).sum(:amount)
  end
end
