class SuggestionsController < ApplicationController
	
	before_action :authenticate_user!, :only => [:new, :create]

	before_action :load_suggestions, :only => [:index, :create]
	before_action :load_new_suggstion, :only => [:index, :new]

	def index
		# @suggestion = Suggestion.new
	end

	def new
		# @suggestion = Suggestion.new
	end

	def create
	 
		@suggestion = Suggestion.new(params["suggestion"].permit(:user_id, :overview, :description, :location))
		@suggestion.user = current_user
		if @suggestion.save
			redirect_to '/suggestions'
		else
			render :new
		end	
	end

	def edit
	end

	def show
		@suggestion = Suggestion.find(params[:id])
	end

	def map
		@suggestions = Suggestion.all
		@suggestion_pins = Gmaps4rails.build_markers(@suggestions) do |suggestion, marker|
  		marker.lat suggestion.latitude
  		marker.lng suggestion.longitude
		end
	end

	private
		def load_suggestions
			@suggestions = Suggestion.all
		end

		def load_new_suggstion
			@suggestion = Suggestion.new
		end

end
