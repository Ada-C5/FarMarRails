class VendorsController < ApplicationController

  def index
    @vendors = Vendor.all
  end

  def show
    @vendor = Vendor.find(params[:id])
    @beg_month = Time.now.beginning_of_month
    @end_month = Time.now.end_of_month
    @all_sales = @vendor.sales.where(purchase_time: (@beg_month..@end_month))
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
      @market = @vendor.market
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

  def edit
    @vendor = Vendor.find(params[:id])
    @market = Market.find(@vendor.market_id)
  end

  def update
    @vendor = Vendor.find(params[:id])
    if @vendor.update(vendor_create_params[:vendor])
      redirect_to market_path(@vendor.market_id)
    else
      render :edit
    end
  end

  private

  def vendor_create_params
    params.permit(vendor: [:name, :no_of_employees, :market_id])
  end

end
