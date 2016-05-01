class MarketsController < ApplicationController

  def new
    @market = Market.new
  end

  def create
    @market = Market.new(market_edit_params[:market])
    if @market.save
      redirect_to markets_path
    else
      render :new
    end
  end

  def index
    @markets = Market.all
    @market = Market.first
    @vendor = Vendor.first
  end

  def show
    @market = Market.find(params[:id])
  end

  def edit
    @market = Market.find(params[:id])
  end

  def update
    @market = Market.find(params[:id])
    if @market.update(market_edit_params[:market])
      redirect_to markets_path
    else
      render :edit
    end
  end

  private

  def market_edit_params
    params.permit(market: [:name, :address, :city, :county, :state,:zip])
  end

end
