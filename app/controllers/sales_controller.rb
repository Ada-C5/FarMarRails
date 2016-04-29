class SalesController < ApplicationController

  def index
    @sales = Sale.where(vendor_id: params[:vendor_id])
    @sales_month = Sale.where(vendor_id: params[:vendor_id]).where(purchase_time: Time.now.beginning_of_month..Time.now.end_of_month)
    render :index
  end


  def show
    @sales = Sale.all.where(params[:vendor_id])
  end

  def new
    @vendor = Vendor.find(params[:vendor_id])
    @sale = @vendor.sales.new
  end

  def create
    @vendor = Vendor.find(params[:vendor_id])
    @sale = @vendor.sales.new(sales_params)
      if  @sale.save
      redirect_to vendor_sales_path
      end

  end


    private

    def sales_params
      params.require(:sale).permit(:amount, :purchase_time)
    end

end
