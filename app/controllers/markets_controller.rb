class MarketsController < ApplicationController

	def index
		@markets = Market.all
	end

	def show
		@markets = Market.where(name: params[:name])
		render :index
	end
end
