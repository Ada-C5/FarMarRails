class VendorsController < ApplicationController
  def index
    @vendors = Vendor.all
    render :index
  end

  def show
    @vendor = Vendor.find(params[:id])
  end

  def new
    @vendor = Vendor.new
    render :new
  end

  def create
    @vendor = Vendor.new(vendors_params[:vendor])
    if @vendor.save
      redirect_to vendors_path
    else
      render :new
    end
  end

  def edit
    @vendor = Vendor.find(params[:id])
    render :edit
  end

  def update
    Vendor.update(vendors_params[:vendor])
    redirect_to vendors_path
  end

  def destroy
    @vendor = Vendor.find(params[:id])
    @vendor.destroy
    redirect_to vendors_path
  end
end

private

def vendors_params
  params.permit(vendor: [:name, :num_employees, :market_id])
end