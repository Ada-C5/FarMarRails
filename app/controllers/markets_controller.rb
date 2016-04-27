class MarketsController < ApplicationController

  def index
    @markets = Market.all
    @market = Market.first
    @vendor = Vendor.first
  end

  def show
    @market = Market.find(params[:id])
  end

end
