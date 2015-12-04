class ForumsController < ApplicationController

  def index
    @forums = Forum.paginate(page: params[:page])
  end



  def show
  	@forum = Forum.find(params[:id])
  end

  def new
  	@forum = Forum.new
  end

  def create
  	@forum = Forum.new
  	if @forum.save
  		flash[:success] = "Forum created."
  		redirect_to @forum
  	else
  		render 'new'
  	end
  end

  private
end
