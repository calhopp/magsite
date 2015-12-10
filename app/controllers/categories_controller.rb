class CategoriesController < ApplicationController

  def index
    @categories = Category.all.where("forum_id = ?", params[:forum_id])
  end

  def show
  	@category = Category.find(params[:id])
  end

  def new
  	@category = Category.new
  end

  def create
  	@category = Category.new
  	if @category.save
  		flash[:success] = "Catergory created."
  		redirect_to @category
  	else
  		render 'new'
  	end
  end

  private
end
