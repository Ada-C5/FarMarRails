class MarketsController < ApplicationController
  def index
    @markets = Market.order(market_name: :asc)
  end

  def show
    @market = Market.find(params[:id])
    @vendors = Vendor.where(market_id: params[:id])
  end

  def new
    @market = Market.new
  end

  def create
    @market = Market.new(market_edit_params[:market])
    if @market.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @market = Market.find(params[:id])
  end

  def update
    @market = Market.update(params[:id],market_edit_params[:market])
    if @market.save
      redirect_to root_path
    else
      render :edit
    end
  end

  private
  def market_edit_params
    params.permit!
  end
end
