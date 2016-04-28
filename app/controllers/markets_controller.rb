class MarketsController < ApplicationController


  def index #VIEWED BY USER
    @markets = Market.order(name: :asc)
    render :index
  end

  def new
    @market = Market.new
    render :new
  end

  def create
    @market = Market.new(create_market_params[:market])
    #unknown if need other things attached, like vendor/sales/products
    if @market.save
      @markets = Market.all
      redirect_to markets_path
    else
      render :new
    end
  end

  def edit
    @market = Market.find(params[:id])
    render :new
  end

  def show
    @market = Market.find(params[:id])
    render :show
  end

  def update
    @market = Market.find(params[:id]).update(create_market_params[:market])
    @markets = Market.all
    render :index  #IF time at end, render a "newly created" view for proofread, avoid list of all markets / index, because markets aren't supposed to see other markets
  end

  def destroy
    @market = Market.find(params[:id]).destroy
    @markets = Market.all
    render :index  #Same as update: If time at end, render not-index
  end



  private
  def create_market_params
    params.permit(market: [:name, :address, :city, :state, :zip_code, market_id: :id])
  end


end
