class MarketsController < ApplicationController
  def index
    @markets = Market.all
  end

  def show
    @market = Market.find(params[:id])
  end

  def new
    @market = Market.new
  end

  def create
    @market = Market.new(market_create_params[:market])
    if(@market.save)
      redirect_to markets_path
    else
      render :add
    end
  end

  def edit
    @market = Market.find(params[:id])
  end

  def update
    market = Market.find(params[:id])
    market.update!(market_create_params[:market])
    redirect_to markets_path
  end

  def market_create_params
    params.permit(market: [:name, :address, :city, :county, :state, :zip])
  end

end
