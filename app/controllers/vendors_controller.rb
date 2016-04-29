class VendorsController < ApplicationController

  def index
    @vendors = Vendor.select(:id, :name).order(:name)
    render :index
  end

  def new
    @vendor = Vendor.new
    render :new
  end

  def create
    @vendor = Vendor.new(create_vendor_params[:vendor])
    #unknown if need other things attached, like vendor/sales/products
    if @vendor.save
      @vendors = Vendor.order(:name)
      redirect_to markets_path
    else
      render :new
    end
  end

  def edit
    @vendor = Vendor.find(params[:id])
    render :new
  end

  def show
    @vendor = Vendor.find(params[:id])
    @market = Market.where(id: @vendor.market_id)
    render :show
  end

  def update
    @vendor = Vendor.find(params[:id]).update(create_vendor_params[:vendor])
    @vendors = Vendor.order(state: :asc, city: :asc)
    redirect_to markets_path  #IF time at end, render a "newly created" view for proofread, avoid list of all vendors / index, because vendors aren't supposed to see other vendors
  end


  def delete
    @vendor = Vendor.find(params[:id]).destroy
    @vendors = Vendor.order(state: :asc, city: :asc)
    redirect_to markets_path  #Same as update: If time at end, render not-index
  end



  private
  def create_vendor_params
    params.permit(vendor: [:name, :id, :employees, :market_id])
  end
end
