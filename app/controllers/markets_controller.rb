class MarketsController < ApplicationController

  def new    # this is for the get
    @market = Market.new
  end

  def update
    @market = Market.find(params[:id])
    @market.update(market_create_params[:market])
    # @market.name = params(:market[:name])
    # puts params[:market][:name]
    redirect_to updated_path
  end

  def create        # this is for the post
    @market = Market.create(market_create_params[:market])
    redirect_to created_path
  end



private
  def market_create_params
   params.permit(market: [:market_number, :name, :address, :city, :county, :state, :zip])
  end


  def market_update_params
   params.permit(market: [:market_number, :name, :address, :city, :county, :state, :zip])
  end

end
