class ProductsController < ApplicationController
  def index
    @products = Product.where(vendor_id: params[:vendor_id])
    render :index
  end


  def show
    @products = Product.all.where(params[:vendor_id])
  end

  def edit
    @vendor = Vendor.find(params[:vendor_id])
    @product = @vendor.products.find(params[:vendor_id])
    render :new
  end



  def update
    @vendor = Vendor.find(params[:vendor_id])
    @products = @vendor.products.find(params[:vendor_id])
    @products.update(product_update_params)
    redirect_to vendor_products_path
  end

#when creating a new controller start with a simple
#method creating a new/show/edit product instance
#then create a view called new/edit/etc for product/
#add link to creat new one using the views add views use line
#rake routes
#then create a create method


  def new
    @vendor = Vendor.find(params[:vendor_id])

    @product = @vendor.products.new
    # @product = Product.new
    # @vendor = Vendor.where(id: params[:vendor_id]).first
    #for nested resources form paths you need to do above.

  end

  def create
    @vendor = Vendor.find(params[:vendor_id])
    @product = @vendor.products.new(product_params)
      if  @product.save
      redirect_to vendor_products_path
      end

  end

  def destroy
    @vendor = Vendor.find(params[:vendor_id])
    @product = @vendor.products.find(params[:id])
    @product.destroy
    redirect_to vendor_products_path

  end

private

def product_params
  params.require(:product).permit(:name)
end

def product_update_params
    params.require(:product).permit(:name)
end

end
