class VendorsController < ApplicationController
  def index
    @vendors = Vendor.all
  end

  def show
    @vendor = Vendor.find(params[:id])
  end

  def new_product

  end

  def edit_product

  end

  def create_product

  end

  def update_product

  end

  def destroy_product

  end



end
