class VendorsController < ApplicationController

  def index
    if params[:market_id] == nil
      @vendors = Vendor.all
    else
      @vendors = Vendor.where(market_id: params[:market_id])
      @market_edit = true
    end
  end

  def show
    @vendor = Vendor.find(params[:id])
  end

  def new
    @market = Market.find(params[:market_id])
    @vendor = @market.vendors.new
  end

  def create
    @vendor = Vendor.new(vendor_create_params[:vendor])
    if @vendor.save
      redirect_to market_vendors_path(params[:market_id])
    else
      redirect_to new_market_vendor_path
    end
  end

  def edit
    @market = Market.find(params[:market_id])
    @vendor = Vendor.find(params[:id])
  end

  def update
    vendor = Vendor.find(params[:id])
    vendor.update!(vendor_create_params[:vendor])
    redirect_to root_path
  end

  def destroy
    vendor = Vendor.find(params[:id]).destroy
    redirect_to market_vendors_path(params[:market_id])
  end

  def vendor_create_params
    params.permit(vendor: [:name, :employee_num, :market_id])
  end

private

end
