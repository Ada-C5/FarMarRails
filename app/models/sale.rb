class Sale < ActiveRecord::Base
  belongs_to :vendor
  validates :amount, presence: true, numericality: {only_integer: true }
  validates :product_id, presence: true 
end
