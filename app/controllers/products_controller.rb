class ProductsController < ApplicationController
  def new
    # give them a shell and invite them to fill out the data.  Allows introspection into the object in the view!
    @product = Product.new
  end

  def create
    @product = Product.new(product_create_params[:product])
    #any validation?
    if @product.save
      redirect_to "/vendors/#{@vendor.id)}/products"
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.update(params[:id], product_edit_params[:product])

    if @product.save
      redirect_to root_path
    else
      render :edit
    end
  end

  # delete a product
  def destroy
    vendor_id = Product.find(params[:id]).vendor_id
    @product = Product.delete(params[:id]) # need a private method?

    redirect_to "/vendors/#{vendor_id}/products"
  end

  private
  def product_create_params
    params.permit(product: [:name, :vendor_id])
  end

  def product_edit_params
    params.permit(product: [:name])
  end

end


