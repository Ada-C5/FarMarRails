class MarketsController < ApplicationController

	def index
		@markets = Market.all
	end

	def show
		@markets = Market.where(id: params[:id])
		@vendors = Vendor.where(market_id: params[:market_id])
	end

	def new
		@market = Market.new
	end

	def create
		@market = Market.create(market_create_params[:market])
		redirect_to markets_path
	end

	def edit
		@market = Market.find(params[:id])
	end

	def update
		@market = Market.find(params[:id])
		@market.update_attributes(market_update_params[:market])
		redirect_to markets_path
	end

	private

	def market_create_params
		params.permit(market: [:name, :street, :city, :county, :state, :zip])
	end

		def market_update_params
		params.permit(market: [:name, :street, :city, :county, :state, :zip])
	end

	
end
