class SuggestionsController < ApplicationController
	
	before_action :authenticate_user!, :only => [:new, :create]

	before_action :load_suggestions, :only => [:index, :create]
	before_action :load_new_suggestion, :only => [:index, :new]

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
		#TODO:ADD ERROR FOR NOT GEOCODED
		@suggestions = Suggestion.geocoded
		@suggestion_pins = Gmaps4rails.build_markers(@suggestions) do |suggestion, marker|
  		marker.lat suggestion.lat
  		marker.lng suggestion.lon
  		marker.infowindow suggestion.description
 		end
	end

	private
		def load_suggestions
			@suggestions = Suggestion.all
		end

		def load_new_suggestion
			@suggestion = Suggestion.new
		end

end
