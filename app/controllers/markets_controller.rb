class MarketsController < ApplicationController

  def new    # this is for the get
    @market = Market.new
  end

  def create        # this is for the post
    @market = Market.create(market_create_params[:market])
    redirect_to created_path
  end

  def created
  end


  def market_create_params
   params.permit(market: [:market_number, :name, :address, :city, :county, :state, :zip])
 end


  def update
  end

end
