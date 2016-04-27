class MarketsController < ApplicationController
  def index
  end

  def new 
    @market = Market.new 
  end 

  def create
    @market = Market.new(new_params[:market])
    if @market.save 
      # show a message saying new market created
      redirect_to root_path
    else
      render :new
    end 
  end
  
  def edit

  end

  def show
  
  end

  def update

  end


  def destroy

  end

  private

  def new_params
    params.permit(market: [:name, :address, :city, :county, :state, :zip])
  end

end
