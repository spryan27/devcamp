class PortfoliaController < ApplicationController
  def index
  	@portfolio_items = Portfolium.all
  end

  def new
  	@portfolio_item = Portfolium.new
  end

  def create
    @portfolio_item = Portfolium.new(params.require(:portfolium).permit(:title, :subtitle, :body))

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolia_path, notice: 'Portfolio item was successfully created.' }
        format.json { render :show, status: :created, location: @portfolio_item }
      else
        format.html { render :new }
        format.json { render json: @portfolio_item.errors, status: :unprocessable_entity }
      end
    end
  end
end
