class Sale < ActiveRecord::Base
	validates :amount, :purchase_time, :vendor_id, :product_id, presence: true

	belongs_to :vendor
	belongs_to :product
end
