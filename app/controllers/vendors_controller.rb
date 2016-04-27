class VendorsController < ApplicationController
  def index
    @all_vendors = Vendor.all
    render :index
  end

  def show
    @vendor = Vendor.find(params[:id])
    @all_products = Product.all
    render :show_vendor
  end

end
