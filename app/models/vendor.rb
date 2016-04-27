class Vendor < ActiveRecord::Base
	validates :name, :market_id, presence: true

	belongs_to :market
	has_many :sales
	has_many :products
end
