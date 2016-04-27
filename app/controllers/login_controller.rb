class LoginController < ApplicationController

  def create
    @market = Market.find(params[:id])
    redirect_to market_path(@market.id)
  end

  def vendorcreate
    @vendor = Vendor.find(params[:id])
    redirect_to vendor_path(@vendor.id)
  end

end
