class UsersController < ApplicationController
	def index
		@users = User.all
	end

	def show
	end

  	def new
    	@user = User.new
  	end

	def create
		@user = User.create(params["user"].permit(:first_name, :last_name, :age, :occupation, :gender))
		@user.save

		redirect_to '/users/'
	end
end
