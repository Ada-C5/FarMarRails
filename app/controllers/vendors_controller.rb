class VendorsController < ApplicationController

  def index
    @vendors = Vendor.all
  end

  def show
    @vendor = Vendor.find(params[:id])
  end

  def destroy
    @vendor = Vendor.find(params[:id])
    if @vendor.destroy
      redirect_to market_path(@vendor.market_id)
    else
      flash.now[:alert] = 'Vendor could not be deleted.'
    end
  end

end
