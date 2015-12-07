module ForumsHelper
	def currentforum
		currentforum = Forum.find(params[:id])
	end
end
