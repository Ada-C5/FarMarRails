class VendorsController < ApplicationController

  def index
    @vendors = Vendor.all
  end

  def show
    @vendor = Vendor.find(params[:id])
  end

  def new
    @vendor = Vendor.new
    @market = Market.find(params["format"])
  end

  def create
    @vendor = Vendor.new(vendor_create_params[:vendor])
    if @vendor.save
      redirect_to market_path(@vendor.market_id)
    else
      flash.now[:alert] = 'Vendor could not be saved.'
      render :new
    end
  end

  def destroy
    @vendor = Vendor.find(params[:id])
    if @vendor.destroy
      redirect_to market_path(@vendor.market_id)
    else
      flash.now[:alert] = 'Vendor could not be deleted.'
    end
  end

  private

  def vendor_create_params
    params.permit(vendor: [:name, :no_of_employees, :market_id])
  end

end
