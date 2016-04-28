class VendorsController < ApplicationController

  def index
    @vendors = Vendor.all
  end


  def show
    @vendor = Vendor.find(params[:id])
  end


  def sales
    @vendors = Vendor.find(params[:id])
    @sales = Sale.where(vendor_number: @vendors.vendor_number)
    render :vendor_sales
  end

  def products
    @vendors = Vendor.find(params[:id])
    @products = Product.where(vendor_number: @vendors.vendor_number)
    render :vendor_products
  end
end
