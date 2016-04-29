class ProductsController < ApplicationController

	def index
		@products = Product.order(id: :asc)
		render :index
	end

	def show
    @vendor = Vendor.find(params[:id])
    render :detail_view
  end

	def new
    @vendors = Vendor.select(:id, :name).order(:name)
    @product = Product.new
    render :create_product
	end

	def create
    @product = Product.create(product_create_params[:product])
    redirect_to products_show_path(@product.vendor_id)
	end

  def edit
    @product = Product.find(params[:id])
    @vendors = Vendor.new
    render :edit
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_update_params[:task])
    redirect_to products_path
  end

	def destroy
   killed_record = Product.destroy(params[:id])
   if params[:id] = true 
     redirect_to products_show_path(killed_record.vendor_id)
   end 
	end

  def product_create_params
    params.permit(product: [:item, :vendor_id]) # these need to be finished with which params need to be let through
  end

  def product_update_params
    params.permit(product: [:item, :vendor_id ]) # these need to be finished with which params need to be let through
  end

end
