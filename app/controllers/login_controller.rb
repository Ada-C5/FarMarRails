class LoginController < ApplicationController

  def create
    @market = Market.find(params[:id])
    redirect_to market_path(@market.id)
  end

end
