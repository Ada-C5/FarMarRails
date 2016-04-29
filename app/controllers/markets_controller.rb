class MarketsController < ApplicationController
  def index
    @markets = Market.all
  end

  def show
    @market = Market.where(id: params[:id]).first
  end

  def new
    @market = Market.new
  end

  def create
    @market = Market.new(market_create_params[:market])  #use the params that you accept
    if @market.save                         #save will return true if it DID save
      redirect_to markets_path               #redirect them somewhere else if not working
    else
      render :new                         #finish the transaction by rendering the view
    end
  end

  def edit
    @market = Market.find(params[:id])
    render :new
  end

  def update
    @market = Market.find(params[:id])
    @market.update(market_update_params[:market])
    redirect_to markets_path
  end

  private

  def market_create_params  #tell rails which params are ok to be in the model
    params.permit(market: [:name, :address, :city, :county, :state, :zip])
  end

  def market_update_params  #tell rails which params are ok to be in the model
    params.permit(market: [:name, :address, :city, :county, :state, :zip])
  end
end
