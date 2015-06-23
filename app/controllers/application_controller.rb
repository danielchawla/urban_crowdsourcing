class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  #before_filtet? deprecated?
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    # request.env['omniauth.origin'] || stored_location_for(resource) || root_path
    request.env['omniauth.origin'] || root_path
  end
  def after_sign_in_path_for(resource)
    # request.env['omniauth.origin'] || stored_location_for(resource) || root_path
    request.env['omniauth.origin'] || root_path
  end

	# protected

	def configure_permitted_parameters
		devise_parameter_sanitizer.for(:sign_up) { |u| u.permit({ roles: [] }, :email, :password, :password_confirmation,  :name, :first_name, :last_name, :age, :occupation, :gender) }
  		devise_parameter_sanitizer.for(:sign_in) { |u| u.permit({ roles: [] }, :email, :password, :password_confirmation,  :name, :first_name) }
	end 
end
