class SalesController < ApplicationController

  def index
    @params = params[:vendor_id]
    @vendor = Vendor.find(params[:vendor_id])
    @sales = @vendor.sales
    if params[:_method] = "monthly_sales"
      @vendor_monthly_sales = @vendor.monthly_sales
    end
  end

  def show
    @sale = Sale.find(params[:sale_id])
  end

  def new
    @vendor = Vendor.find(params[:vendor_id])
   @sale = Sale.new
  end

 def create
   @sale = Sale.create(sale_create_params[:sale])
   @vendor = Vendor.where(id: params.fetch(:vendor_id)).first
   @sale = Sale.create(params[:sale_id])
   if @vendor
     redirect_to vendor_sales_path(id: @vendor.id)
   else
     render :new
   end
 end

 private
  def sale_create_params
    params.permit(sale: [:amount, :sale_id])
  end

end
