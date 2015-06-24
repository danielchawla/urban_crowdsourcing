class MainController < ApplicationController
	def index
		@suggestions = Suggestion.all
		@suggestion_pins = Gmaps4rails.build_markers(@suggestions.geocoded) do |suggestion, marker|
  			marker.lat suggestion.lat
  			marker.lng suggestion.lon
  			marker.infowindow render_to_string(:partial => "/suggestions/suggestion", :locals => {:suggestion => suggestion})
		end
	end
end
