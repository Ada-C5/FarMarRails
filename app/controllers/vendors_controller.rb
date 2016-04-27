class VendorsController < ApplicationController

  def index
    @vendors = Vendor.find.all
    render :index
  end

  def show
    @vendors_listed = Vendor.find.(params[:id])
    render :index
  end

  def new
    @new_vendor = Vendor.new
  end

  def create

  end

  def edit

  end

  def update

  end

  def destroy

  end
end
