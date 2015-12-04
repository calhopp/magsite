class CatergoriesController < ApplicationController

  def index
    @catergories = Catergory.all
  end

  def show
  	@catergory = Catergory.find(params[:id])
  end

  def new
  	@catergory = Catergory.new
  end

  def create
  	@catergory = Catergory.new
  	if @catergory.save
  		flash[:success] = "Catergory created."
  		redirect_to @catergory
  	else
  		render 'new'
  	end
  end

  private
end
