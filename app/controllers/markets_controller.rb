class MarketsController < ApplicationController
  def index
    @all_markets = Market.order(name: :asc)
    render :index
  end

  def show
    @market = Market.find(params[:id])
    @all_vendors = Vendor.all
    render :show
  end

  def new
    @market = Market.new
    @all_vendors = Vendor.all
  end

end
