class SalesController < ApplicationController

def index
  @sales = Sale.where(vendor_id: params[:vendor_id])
  render :index
end


def show
  @sales = Sale.all.where(params[:vendor_id])
end



end
