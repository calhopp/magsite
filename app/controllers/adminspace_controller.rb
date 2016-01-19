class AdminspaceController < ApplicationController
	before_action :admin_user, only: [:admin]
	def admin
		@news = News.new
	end
	private
	def admin_user
		if logged_in?
    redirect_to(root_url) unless current_user.admin?
else
	redirect_to(root_url)
end
  end
end
