class MarketsController < ApplicationController

  def index
    @markets = Market.all
  end

  def show
    @market = Market.find(params[:id])
  end

  # methods for making a NEW (not yet existing) Market
  def new
    # give them a shell and invite them to fill out the data.  Allows introspection into the object in the view!
    @market = Market.new
  end

  def create
    @market = Market.new(market_create_params[:market])
    #any validation?
    if @market.save
      redirect_to root_path
    else
      render :new
    end
  end

  # methods for updating a Market that already EXISTS
  def edit
    @market = Market.find(params[:id])
  end

  def update
    @market = Market.update(params[:id], market_edit_params[:market])

    if @market.save
      redirect_to root_path
    else
      render :edit
    end
  end

  # delete a Market
  def destroy
    @market = Market.delete(params[:id]) # need a private method?
    redirect_to root_path
  end

  private
  def market_create_params
    params.permit(market: [:name, :address, :city, :county, :state, :zip])
  end

  def market_edit_params
    params.permit(market: [:name, :address, :city, :county, :state, :zip, :updated_at])
  end

end
