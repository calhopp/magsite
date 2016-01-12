class CategoriesController < ApplicationController
  before_action :admin_user, only: [:new, :create]

  def index
    @categories = Category.all.where("forum_id = ?", params[:forum_id])
  end

  def show
  	@category = Category.find(params[:id])
    @topics = @category.topics(params[:category_id])
    @forum = @category.forum
  end

  def new
    @forum = Forum.find(params[:forum_id])
  	@category = Category.new
  end

  def create
    @forum = Forum.find(params[:forum_id])
    @category = Category.new(category_params)
    @category.forum = @forum
  	if @category.save
  		flash[:success] = "Catergory created."
  		redirect_to forum_path(@forum.id)
  	else
  		render 'new'
  	end
  end

  private
  def category_params
    params.require(:category).permit(:title, :description)
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end
