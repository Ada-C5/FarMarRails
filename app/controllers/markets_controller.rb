class MarketsController < ApplicationController
  def index
    @all_markets = Market.order(name: :asc)
    render :index
  end

  def show
    @market = Market.find(params[:id])
    render :show
  end

end
