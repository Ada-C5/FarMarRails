class SalesController < ApplicationController

  def index
    @all_sales = Sale.all
    @vendor = Vendor.find(params[:vendor_id])
    render :index
  end

end
