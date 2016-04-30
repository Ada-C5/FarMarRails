class MarketsController < ApplicationController

  def index
    @markets = Market.all
    @main_page = true
  end

  def show
    @market = Market.find(params[:id])
    render :show
    @page_title = @market.name

  end

  def new
    @market = Market.new
  end

  def create
    @market = Market.new(new_params[:market])
    if @market.save
      # message stating new market created?
      redirect_to markets_path
    else
      render :new
    end
  end

  def edit
    @market = Market.find(params[:id])
  end

  def update
    @market = Market.find(params[:id])
    @market.update(update_params[:market])
    redirect_to markets_path
  end


  def destroy
    Market.destroy(params[:id])
    if params[:id] = true
      # message stating that the market has been deleted?
      redirect_to markets_path
    end
  end

  private

  def new_params
    params.permit(market: [:name, :address, :city, :county, :state, :zip])
  end

  def update_params
    params.permit(market: [:name, :address, :city, :county, :state, :zip])
  end
end
