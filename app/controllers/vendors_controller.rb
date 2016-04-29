class VendorsController < ApplicationController
  def index
    @vendors = Vendor.all
  end

  def show
    @vendor = Vendor.find(params[:id])
    @vendor ||= Vendor.find(params[:vendor_id])
    @all_sales = @vendor.sales
    thirty_days = Time.now - (30*24*60*60)
    @month_sales = @vendor.sales.where(purchase_time: thirty_days..Time.now)
    params[:sales_list] == "2" ? @sales_list = @month_sales : @sales_list = @all_sales
    @selected = params[:sales_list].to_i
  end

  def new
    @vendor = Vendor.new
    @market = Market.find(params[:market_id])
  end

  def create
    @vendor = Vendor.new(new_params[:vendor])
    if @vendor.save
      @vendor.update(market_id: params[:market_id])
      redirect_to market_path(params[:market_id])
    else
      render :new
    end
  end

  def edit
    @vendor = Vendor.find(params[:id])
  end

  def update
    @vendor = Vendor.find(params[:id])
    @vendor.update(update_params[:vendor])
    redirect_to market_path
  end


  def destroy
    Vendor.destroy(params[:id])
    if params[:id] = true
      # message stating that the market has been deleted?
      redirect_to market_path
    end
  end

  private

  def new_params
    params.permit(vendor: [:name, :number_of_employees])
  end

  def update_params
    params.permit(vendor: [:name, :number_of_employees])
  end

end
