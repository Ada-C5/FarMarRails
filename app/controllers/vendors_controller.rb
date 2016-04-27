class VendorsController < ApplicationController

  def index
    @vendors = Vendor.uniq.order(name: :asc)
  end

  def show
    @vendors = Vendor.where(id: params[:id])
  end

  def new
    @vendor = Vendor.new  #creates vendor so that we can access the form
  end

  def create
    @vendor = Vendor.new(vendor_create_params[:vendor])
    if @vendor.save
      redirect_to :index
    else
      render :new
    end
  end

  def edit
    @vendor = Vendor.find(params[:id])
    render :new
  end

  def update
    @vendor = Vendor.find(params[:id])
    @vendor.update(vendor_update_params[:vendor])
    redirect_to root_path
  end

  private

  def vendor_create_params
    params.permit(vendor: [:name, :employee_count])
  end

  def vendor_update_params
    params.permit(vendor: [:name, :employee_count])
  end

end
