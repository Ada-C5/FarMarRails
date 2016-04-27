class HomesController < ApplicationController
  def index
    @markets = Market.order(market_name: :asc)
  end

  def show

  end
end
