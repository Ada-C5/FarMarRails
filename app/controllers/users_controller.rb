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
    @vendors = @market.vendors
    render :single_market
  end
end
