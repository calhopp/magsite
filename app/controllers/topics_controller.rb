class TopicsController < ApplicationController
  def index
    @topics = Topic.all.where("category_id = ?", params[:category_id]) 
  end

   def show
  	@topic = Topic.find(params[:id])
    @posts = @topic.posts.paginate(page: params[:page])
    @post = current_user.posts.build if logged_in?
    
  end

  def new
    @forum = Forum.find(params[:forum_id])
    @category = Category.find(params[:category_id])
  	@topic = Topic.new
  end

  def create
    @forum = Forum.find(params[:forum_id])
    @category = @forum.categories.find(params[:category_id])
  	@topic = Topic.new(topic_params)
    @topic.category = @category
  	if @topic.save
  		flash[:success] = "Topic created."
  		redirect_to forum_category_path(@forum.id, @category.id)
  	else
  		render 'new'
  	end
  end

  private
  def topic_params
    params.require(:topic).permit(:title, :description)
  end
end