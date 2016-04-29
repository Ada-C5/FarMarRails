class SalesController < ApplicationController

  def index
    @all_sales = Sale.all
    @vendor = Vendor.find(params[:vendor_id])
    render :index
  end

  def new
    @sale = Sale.new
    @vendor = Vendor.find(params[:vendor_id])
  end

  def create
    default = { :purchase_time => DateTime.now }
    @sale = Sale.new(default.merge(sale_create_params[:sale]))
    @vendor = Vendor.find(params[:vendor_id])
    if(@sale.save)
      @vendor.sales << @sale
      redirect_to vendor_sales_path(@vendor.id)#redirect in case user tries to post another form - brings them to entered view
    else
      render :new
    end
  end

  private

    def sale_create_params#the params we want when we create a task, to sanitize and control user input
      params.permit(sale: [:amount, :product_id])#these are the only parameters that can be passed from user.
    end

end
