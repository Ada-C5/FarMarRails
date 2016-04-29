class SalesController < ApplicationController
  def new
    @vendor = Vendor.find(params[:vendor_id])
    @sale = @vendor.sales.new
    @product = Product.where(:vendor_id => @vendor.id)
  end

  def create
    @sale = Sale.new(sale_create_params[:sale])
    @sale.purchase_time = Time.now
    if @sale.save
      redirect_to vendor_path(params[:vendor_id])
    else
      redirect_to new_vendor_product_path(params[:vendor_id])
    end
  end

  private

  def sale_create_params
    params.permit(sale: [:amount, :vendor_id, :product_id])
  end
end
