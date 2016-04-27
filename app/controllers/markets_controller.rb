class MarketsController < ApplicationController

  def new
    @market = Market.new
    render :new
  end

  def create
    @market = Market.new(markets_params[:market])
    if @market.save
      redirect_to markets_path
    else
      render :new
    end
  end

  def edit
    @market = Market.find(params[:id])
    render :edit
  end

  def update
    Market.update(params[:id], markets_params[:market])
    redirect_to markets_path
  end
end

private

def markets_params
  params.permit(market: [:name, :address, :city, :county, :state, :zip])
end