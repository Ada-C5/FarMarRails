class SalesController < ApplicationController
  def index
    @vendor = Vendor.find(params[:id])
    @sales = @vendor.sales
  end
end
