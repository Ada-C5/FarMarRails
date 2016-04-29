class Sale < ActiveRecord::Base
  belongs_to :product
  belongs_to :vendor

  def self.sales_this_month(desired_month, ven_id)
    where("strftime('%m', purchase_time) = ?", desired_month).where(vendor_id: ven_id)
  end
end
 