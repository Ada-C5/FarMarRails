class MarketsController < ApplicationController

	def index
		@markets = Market.all
	end

	def show
		@markets = Market.where(id: params[:id])
		@vendors = Vendor.where(market_id: params[:market_id])
		render :index
	end
	
end
