class VendorsController < ApplicationController

  def index
    @vendors = Vendor.all
    render :index
  end

  def show
    @vendors_listed = Vendor.find.(params[:id])
    render :index
  end

  def new
    @new_vendor = Vendor.new
    render :new
  end

  def create
    @new_vendor = Vendor.new(new_vendor_create_params[:vendor])
    if @new_vendor.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @vendor = Vendor.find(params[:id])
    render :edit
  end

  def update
    @vendor = Vendor.find(params[:id])
    if @vendor.update(new_vendor_create_params[:vendor])
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @vendor = Vendor.destroy(params[:id])
    redirect_to root_path
  end

  private

  def new_vendor_create_params
    params.permit(vendor: [:vendor_id, :vendor_name, :num_of_employees, :market_id]) #you must permit parameters when you want to allow access to the user to create new data using the params. The user is ONLY permitted to access the artist and title parameters.
  end
end
