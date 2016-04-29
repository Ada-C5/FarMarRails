require 'date'

class SalesController < ApplicationController

  def show
    @sale = Sale.where(vendor_id: params[:id]).order(purchase_time: :asc)
    @group = Sale.group("strftime('%m', purchase_time)").count
    render :show
  end

  def month_sale
    @group = Sale.group("strftime('%m', purchase_time)").count
    @v_id = params[:id]
    @month = params[:name]
    @month_num = {'JAN' => "01", 'FEB' => "02", 'MAR' => "03", 'APR' => "04", 'MAY' => "05", 'JUN' => "06",'JUL' => "07", 'AUG' => "08",'SEP' => "09", 'OCT' => "10", 'NOV' => "11", 'DEC' => "12"}
    @num = @month_num[@month]
    @sale = Sale.where("cast(strftime('%m', purchase_time) as int) = ?", @num).where("vendor_id = ?", @v_id)
  end

  def new
    @sale = Sale.new
    @product = Product.where(vendor_id: params[:id])
    @vendor = Vendor.find(@product.vendor_id)
    render :new
  end

  def create
#I HATE THIS IT IS THE WORST:
    params[:sale][:amount] = params[:sale][:amount].to_s.gsub(/\./, '')
#END OF HATE
    @sale = Sale.new(new_sale_create_params[:sale])
    if @sale.save
      @sale[:sale_id] = @sale[:id]
      @sale.save
      redirect_to product_path(@sale.vendor_id)
    else
      render :new
    end
  end

  private

  def new_sale_create_params
    params.permit(sale: [:sale_id, :amount, :vendor_id, :product_id])
  end
end
