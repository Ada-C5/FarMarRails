class UsersController < ApplicationController

  def index
    #main page logic
  end

  def all_markets
    @all_markets = Market.all
    # raise
  end
end
