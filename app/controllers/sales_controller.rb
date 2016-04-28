class SalesController < ApplicationController

  def index
    @sales = Sale.all
  end

  def new
    @sale = Sale.new
    @vendor = Vendor.find(params["format"])
    @products = @vendor.products
  end

  def create
    @sale = Sale.find(params[:id])
      if @sale.save
        redirect_to vendor_path(@sale.vendor_id)
      else
        render :new
      end
  end

  # private
  # def sale_create_params
  # params.permit(sale: [:title, :description, :person_id])
  # end

end
