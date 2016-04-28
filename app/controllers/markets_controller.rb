class MarketsController < ApplicationController

  def index
    @markets = Market.order(id: :asc)
  end

  def show
    # display the market info
    # set to an instance method
    # find is a class method so call on the class Market
    @market = Market.find(params[:id])

  end


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
