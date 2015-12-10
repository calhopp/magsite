class TopicsController < ApplicationController
  def index
    @topics = Topic.all.where("category_id = ?", params[:category_id]) 
  end

   def show
  	@topic = Topic.find(params[:id])
  end

  def new
  	@topic = Topic.new
  end

  def create
  	@topic = Topic.new
  	if @topic.save
  		flash[:success] = "Topic created."
  		redirect_to @topic
  	else
  		render 'new'
  	end
  end

  private
end