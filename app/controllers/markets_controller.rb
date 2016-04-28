class MarketsController < ApplicationController
  def index
    @all_markets = Market.order(name: :asc)
    render :index
  end

  def show
    @market = Market.find(params[:id])
    @all_vendors = Vendor.all
    render :show
  end

  def new
    @market = Market.new
    @all_vendors = Vendor.all
  end

  def create
    @market = Market.new(market_create_params[:market])
    if(@market.save)
      redirect_to market_path(@market.id)#redirect in case user tries to post another form - brings them to entered view
    else
      render :new
    end
  end

  def edit
    @market = Market.find(params[:id])
    @all_vendors = Vendor.all
    render :edit
  end

  def update
    @market = Market.find(params[:id])
    if @market.update(market_edit_params[:market])
      redirect_to market_path(@market.id)#redirect in case user tries to post another form - brings them to entered view
    else
      render :edit
    end#redirect in case user tries to post another form - brings them to entered view
end

  private

    def market_create_params#the params we want when we create a task, to sanitize and control user input
      params.permit(market: [:name, :address, :city, :county, :state, :zip_code])#these are the only parameters that can be passed from user.
    end

    def market_edit_params
      params.permit(market: [:name, :address, :city, :county, :state, :zip_code])
    end


end
