class VendorsController < ApplicationController
  def index
    @all_vendors = Vendor.all
    render :index
  end

  def show
    @vendor = Vendor.find(params[:id])
    @all_products = Product.all
    render :show_vendor
  end

  def new
    @vendor = Vendor.new
  end

  def create
    @vendor = Vendor.new(vendor_create_params[:vendor])
    if(@vendor.save)
      redirect_to vendors_path(@vendor.id)#redirect in case user tries to post another form - brings them to entered view
    else
      render :new
    end
  end

  def edit
    @vendor = Vendor.find(params[:id])
    @all_vendors = Vendor.all
    render :edit
  end

  def update
    @vendor = Vendor.find(params[:id])
    if @vendor.update(vendor_edit_params[:vendor])
      redirect_to vendor_path(@vendor.id)#redirect in case user tries to post another form - brings them to entered view
    else
      render :edit
    end#redirect in case user tries to post another form - brings them to entered view
  end

  def destroy
    @vendor = Vendor.find(params[:id])
    @vendor.destroy
    redirect_to market_path(@vendor.market_id)
  end

  private

    def vendor_create_params#the params we want when we create a task, to sanitize and control user input
      params.permit(vendor: [:name, :no_of_employees, :market_id])#these are the only parameters that can be passed from user.
    end

    def vendor_edit_params
      params.permit(vendor: [:name, :no_of_employees, :market_id])
    end


end
