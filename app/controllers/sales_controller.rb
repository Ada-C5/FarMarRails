class SalesController < ApplicationController

  def index
    @params = params[:vendor_id]
    @vendor = Vendor.find(params[:vendor_id])
    @sales = @vendor.sales
  end

  def show
    @sale = Sale.find(params[:sale_id])
  end

  def load_vendor
    @vendor = Vendor.find(params[:vendor_id])
  end
end
