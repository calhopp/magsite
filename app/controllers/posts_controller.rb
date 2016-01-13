class PostsController < ApplicationController
    include SessionsHelper

	before_action :logged_in_user, only: [:create, :destroy]

  def destroy
    @forum = Forum.find(params[:forum_id])
    @category = @forum.categories.find(params[:category_id])
    @topic = @category.topics.find(params[:topic_id])
    Post.find(params[:id]).destroy
    flash[:success] = "Post deleted."
    redirect_to forum_category_topic_path(@forum, @category, @topic)
  end

  def create
    #user = current_user
    #topic = params[:topic]
    #content = params[:content]

    #@post = Post.new
    #@post.user = user
    #@post.topic = topic
    #@post.content = content

  	@post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "Post created!"
      redirect_to :back
    else
      render 'static_pages/home'
    end
  end

  def destroy
    Post.find(params[:id]).destroy
        flash[:success] = "Post deleted."
        redirect_to :back
  end

  def admin
    @admin = current_user.admin?
  end

  private

  	def post_params
      params.require(:post).permit(:content, :topic_id)
    end
end
#I needed a change to push, so here.