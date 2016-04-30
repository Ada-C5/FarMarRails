class Vendor < ActiveRecord::Base
	validates :name, :market_id, presence: true

	belongs_to :market
	has_many :sales
	has_many :products

	def monthly_sales
		start_date = Time.parse("November 1, 2013")
		end_date = Time.parse("November 30, 2013")
		self.sales.where(purchase_time: start_date..end_date)
	end

	def monthly_sales_total
		amount = self.current_month_sales.pluck(:amount).reduce(0,:+)/100
		format("$%.2f",amount)
	end

	def current_month_sales
		self.sales.where(purchase_time: 30.day.ago..Time.now)
	end


	# def sales_between(start_date, end_date)
	# 	sales = self.sales.pluck(:purchase_time)
	# 	result = sales.all.select {|sale| (start_date..end_date).cover? (sale.purchase_time) }
	# 	result.reduce(0, :+)
	# end
	#
	def total_sales
		total = (self.sales.pluck(:amount).reduce(0, :+)/100)
		format("$%.2f",total)
	end

end
