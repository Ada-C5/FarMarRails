class SalesController < ApplicationController
  def new
    @vendor = Vendor.find(params[:vendor_id])
    @sale = Sale.new
  end

  def create
    @vendor = Vendor.find(params[:vendor_id])
    @sale = Sale.new(create_sale_params[:sale])
    if @sale.save
      # We thought the purchase time should be generated at the time the Sale is created
      # as if from a POS system, we didn't think Vendor should have to manually input
      # the date and time of the sale
      @sale.update(vendor_id: params[:vendor_id], purchase_time: Time.now, product_id: create_sale_params[:sale][:product_id])
      # raise
      redirect_to vendor_path(params[:vendor_id])
    else
      render :new
    end
  end

  private
  def create_sale_params
    params.permit(sale: [:amount, :product_id])
  end

end
