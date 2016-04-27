class VendorsController < ApplicationController
  def index
    if params[:market_id] == nil
      @vendors = Vendor.all
    else
      @vendors = Vendor.where(market_id: params[:market_id])
    end
  end

  def show
    @vendor = Vendor.find(params[:id])
  end
end
