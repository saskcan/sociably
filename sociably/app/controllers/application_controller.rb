class ApplicationController < ActionController::Base
	
	before_filter :authenticate_user!
	before_filter :configure_permitted_parameters, if: :devise_controller?

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected
  # add name to the list of permitted parameters for devise sign-up
  def configure_permitted_parameters
  	devise_parameter_sanitizer.for(:sign_up) << :name
  end

  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end

  def after_sign_in_path_for(resource_or_scope)
    subscriptions_path
  end

end
