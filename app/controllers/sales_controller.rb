class SalesController < ApplicationController


  def new
    # give them a shell and invite them to fill out the data.  Allows introspection into the object in the view!
    @sale = Sale.new
  end

  def create
    @sale = Sale.new(sale_create_params[:sale])
    #any validation?
    if @sale.save
      redirect_to "/vendors/#{@sale.vendor_id}/sales"
    else
      render :new
    end
  end

  private
  def sale_create_params
    params.permit(sale: [:name, :vendor_id, :amount, :product_id, :purchase_time])
  end
end
