class SuggestionsController < ApplicationController

	before_action :authenticate_user!, :only => [:new, :create, :vote]
	before_action :load_suggestions, :only => [:index, :create]
	before_action :load_new_suggestion, :only => [:index, :new]

	def index
		if !(current_user.try(:admin?))
  			#suggestion_collection = Suggestion.all.where(:approved => true)
			@suggestions = Suggestion.all.where(:approved => true).order('id DESC').paginate(:page => params[:page], :per_page => 5)
			@suggestion_pins = Gmaps4rails.build_markers(Suggestion.all.where(:approved => true).geocoded) do |suggestion, marker|
  				marker.lat suggestion.lat
  				marker.lng suggestion.lon
  				marker.infowindow render_to_string(:partial => "/suggestions/suggestion", :locals => {:suggestion => suggestion})
			end
		else
			@suggestions = Suggestion.all.order('id DESC').paginate(:page => params[:page], :per_page => 3)
			@suggestion_pins = Gmaps4rails.build_markers(Suggestion.all.geocoded) do |suggestion, marker|
  				marker.lat suggestion.lat
  				marker.lng suggestion.lon
  				marker.infowindow render_to_string(:partial => "/suggestions/suggestion", :locals => {:suggestion => suggestion})
			end

		end
	end

	def new
		# @suggestion = Suggestion.new
	end

	def create
	 
		@suggestion = Suggestion.new(params["suggestion"].permit(:user_id, :overview, :description, :location, :sug_img))
		@suggestion.user = current_user
		if @suggestion.save

			redirect_to '/suggestions', notice: "Suggestion successfully created! Pending admin approval."
		else
			render :new
		end	
	end

	def edit
	end

	def show
		@suggestion = Suggestion.find(params[:id])
		session[:last_suggestion_page] = request.env['HTTP_REFERER'] || suggestions_path
	end

	def map


		# @hash = Gmaps4rails.build_markers(@users) do |user, marker|
  #  		    marker.lat user.latitude
  #    		marker.lng user.longitude
  #   	    marker.json({:id => user.id })
     		
  #     		marker.infowindow render_to_string(:partial => "/users/3", :locals => { :object => user})
  #   end




	#	TODO:ADD ERROR FOR NOT GEOCODED
		@suggestions = Suggestion.geocoded.includes(:comments, :user)
		@suggestion_pins = Gmaps4rails.build_markers(@suggestions) do |suggestion, marker|
  		marker.lat suggestion.lat
  		marker.lng suggestion.lon
  		# marker.picture({
  		# 	"url" => "/assets/bg.jpg",
  		# 	"width" =>  32,
    #  	    "height" => 32})
 #marker.infowindow render_to_string(:partial => "/users/my_template", :locals => { :object => user}) 			
 marker.infowindow render_to_string(:partial => "/suggestions/suggestion", :locals => {:suggestion => suggestion})
 # marker.infowindow suggestion.description 
 		end
	end

	def approve
   	 @suggestion = Suggestion.find(params[:id])
   	 @suggestion.approved = true
   	 @suggestion.save
   	 redirect_to request.env['HTTP_REFERER'] #suggestion_path(@suggestion)
 	end

 	def destroy
 		@suggestion = Suggestion.find(params[:id])
 		@suggestion.destroy
 		redirect_to suggestions_path
 	end

 	def vote
  		@suggestion = Suggestion.find(params[:id])
  		@suggestion.liked_by current_user
  		redirect_to request.env['HTTP_REFERER']
	end
	

	private
		def load_suggestions
			@suggestions = Suggestion.all
		end

		def load_new_suggestion
			@suggestion = Suggestion.new
		end

end
