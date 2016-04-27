class MarketsController < ApplicationController

  def index
    @markets = Market.order(id: :asc)
  end

  def show
    # display the market info
    # set to an instance method
    # find is a class method so call on the class Market 
    @markets = Market.find(params[:id])
  end

end
