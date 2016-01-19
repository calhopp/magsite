class NewsController < ApplicationController
	def new
		@news = News.new
	end

	 def create
  	@news = News.new(news_params)
  	if @news.save
  		flash[:success] = "News created."
  		redirect_to admin_path
  	else
  		render 'new'
  	end
  end
  private
  def news_params
    params.require(:news).permit(:content)
  end
end
