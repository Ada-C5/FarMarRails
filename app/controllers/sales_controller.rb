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

  def monthly_sales
    @params = params[:vendor_id]
    @vendor = Vendor.find(params[:vendor_id])
    @sales = @vendor.sales
    if params[:_method] = "monthly_sales"
      @vendor_monthly_sales = @vendor.monthly_sales
    end
  end

  def load_vendor
    @vendor = Vendor.find(params[:vendor_id])
  end
end
