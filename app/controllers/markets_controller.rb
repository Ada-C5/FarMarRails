class MarketsController < ApplicationController

  def index
    @markets = Market.all
    @market = Market.first
    @vendor = Vendor.first
  end

  def show
    @markets = Market.find(params[:id])
  end

end
