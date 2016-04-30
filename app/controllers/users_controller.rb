class UsersController < ApplicationController

  def index
    #main page logic
  end

  def all_markets
    @all_markets = Market.all
    # raise
  end

  def show
    @market = Market.find(params[:id])
    @vendors = Vendor.where(market_number: @market.market_number) 
    render :single_market
  end
end
