class PostsController < ApplicationController
	before_action :logged_in_user, only: [:create, :destroy]

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
  end

  private

  	def post_params
      params.require(:post).permit(:content, :topic_id)
    end
end
#I needed a change to push, so here.