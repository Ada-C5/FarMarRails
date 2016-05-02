class VendorsController < ApplicationController
  def index
    @vendors = Vendor.all
  end

  def show
   @vendors_id = Vendor.find(params[:id])
  end

  def new
    @vendor = Vendor.new
  end

  def create
    @vendor = Vendor.new(vendor_params[:vendor])
    if @vendor.save
      redirect_to market_path(id: @vendor.market_id)
    end
  end

  def edit
    @vendor = Vendor.find(params[:id])
    render :new
  end

  def update
    @vendor = Vendor.find(params[:id])
    if @vendor.update(vendor_update_params[:vendor])
      redirect_to market_path(id: @vendor.market_id)
    else
      render :new
    end
  end

  def destroy
    @vendor = Vendor.find(params[:id])
    @vendor.destroy
    redirect_to market_path(id: @vendor.market_id)
  end

private

def vendor_params
  params.permit(vendor: [:name, :no_of_employees, :market_id])
end

def vendor_update_params
  params.permit(vendor: [:name, :no_of_employees, :market_id])
end

end
