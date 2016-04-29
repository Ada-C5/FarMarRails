class SalesController < ApplicationController


	def index
		@vendor = Vendor.all
    render :list_all
	end

	def new
    @products = Product.select(:id, :item).order(:item)
    @vendors = Vendor.select(:id, :name).order(:name)
    @sale = Sale.new
    render :new
	end

	def show
    @vendor = Vendor.find(params[:id])
    render :list_all
  end

	def create
    @sale = Sale.create(sales_create_params[:sale])
    redirect_to sales_show_path(@sale.vendor_id)
	end

  def sales_create_params
    params.permit(sale: [:sale_amount, :vendor_id, :product_id, :transaction_time]) # these need to be finished with which params need to be let through
  end

  def sales_update_params
    params.permit(sale: [:sale_amount, :vendor_id, :product_id, ]) # these need to be finished with which params need to be let through
  end

end
