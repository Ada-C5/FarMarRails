class Product < ActiveRecord::Base
	validates :name, :vendor_id, presence: true
	belongs_to :vendor
	has_many :sales

end
