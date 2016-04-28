class VendorsController < ApplicationController

  def index
    @vendors = Vendor.all
  end

  def show
    @vendors = Vendor.find(params[:id])
    @sales = Sale.where(vendor_number: @vendors.vendor_number)
    render :vendor_sales
  end
end
