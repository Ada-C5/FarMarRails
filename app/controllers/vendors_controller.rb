class VendorsController < ApplicationController

  def index
    @vendors = Vendor.order(id: :asc)
  end

  def show
    @vendor = Vendor.find(params[:id])
  end

end
