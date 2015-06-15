class SuggestionsController < ApplicationController
	def index
		@suggestions = Suggestion.all
	end

	def show
	end

	def new
		@suggestion = Suggestion.new
	end

	def create
		@suggestion = Suggestion.new(params["suggestion"].permit(:user_id, :overview, :description, :location))
		@suggestion.save

		redirect_to '/suggestions'
	end

end


    # t.integer "user_id"
    # t.string  "overview"
    # t.string  "description"
    # t.string  "location"
