class PortfoliaController < ApplicationController
  def index
  	@portfolio_items = Portfolium.all
  end
end
