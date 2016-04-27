class Sale < ActiveRecord::Base
  has_one :product
  has_one :vendor
end
