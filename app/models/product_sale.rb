class ProductSale < ActiveRecord::Base
  has_many :sales
  has_many :products
end
