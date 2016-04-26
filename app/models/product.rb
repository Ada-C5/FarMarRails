class Product < ActiveRecord::Base
  belongs_to :vendor
  belongs_to :product_sale
end
