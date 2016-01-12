class ForumsController < ApplicationController

  def index
    @forums = Forum.paginate(page: params[:page])
  end



  def show
  	@forum = Forum.find(params[:id])
    @categories = @forum.categories(params[:forum_id])
  end

  def new
  	@forum = Forum.new
  end

  def create
  	@forum = Forum.new(forum_params)
  	if @forum.save
  		flash[:success] = "Forum created."
  		redirect_to forums_path
  	else
  		render 'new'
  	end
  end

  private
  def forum_params
    params.require(:forum).permit(:title, :description)
  end
end
