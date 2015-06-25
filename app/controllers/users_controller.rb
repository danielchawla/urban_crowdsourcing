class UsersController < ApplicationController
	
	before_action :authenticate_user!

	def index
		@users = User.all
	end

  	def new
    	@user = User.new
  	end

	def create
		@user = User.create(params["user"].permit(:first_name, :last_name, :age, :occupation, :gender))
		#s@user.save
		
		if @user.save
			redirect_to '/suggestions'
		else
			render :new
		end	
	end

	def show
		#binding.pry
		@user = User.find(params[:id])
		@suggestions = @user.suggestions.order('id DESC').paginate(:page => params[:page], :per_page => 5)
	end



	def edit
	end
end
