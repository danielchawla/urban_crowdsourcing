class CommentsController < ApplicationController

	def index
		@comments = Comment.all
	end

	def new
		@suggestion = Suggestion.find(params[:suggestion_id])
		@comment = Comment.new
	end

	def create
		@suggestion = Suggestion.find(params[:suggestion_id])
		
		@comment = @suggestion.comments.new(params["comment"].permit(:text))
		@comment.user = current_user
		@comment.user_id=current_user.id
		
		if @comment.save
			redirect_to @suggestion
		else
			p "-------------------------------"
		end	


	end



end
 