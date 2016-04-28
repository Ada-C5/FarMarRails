class VendorsController < ApplicationController
  def index
    @vendors = Vendor.all
  end

  def show
   @vendors_id = Vendor.find(params[:id])
  end



end
