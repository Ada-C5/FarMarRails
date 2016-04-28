class MarketsController < ApplicationController

  def new    # this is for the get
    @market = Market.new
  end

  def create        # this is for the post
    @market = Market.new(params[:market])
    @market.save
    redirect_to market_path
  end

  def update
  end

end
