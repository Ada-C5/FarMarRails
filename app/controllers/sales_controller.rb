class SalesController < ApplicationController
  def new
    @vendor = Vendor.find(params[:vendor_id])
    @sale = Sale.new
  end

  def create
    @vendor = Vendor.find(params[:vendor_id])
    @sale = Sale.new(create_sale_params[:sale])
    if @sale.save
      @sale.update(vendor_id: params[:vendor_id])
      redirect_to vendor_path(params[:vendor_id])
    else
      render :new
    end
  end

  private
  def create_sale_params
    params.permit(sale: [:amount, :purchase_time])
  end

end
