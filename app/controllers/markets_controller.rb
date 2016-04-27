class MarketsController < ApplicationController
  def index
    @markets = Market.order(market_name: :asc)
  end

  def show
    @market = Market.find(params[:id])
    @vendors = Vendor.where(market_id: params[:id])
  end

end
