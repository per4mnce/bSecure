class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  #before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_in) << [:pin]
    devise_parameter_sanitizer.for(:sign_up) << [:pin, :pin_confirmation]
  end
  
  def after_sign_in_path_for(resource)
    # Display data grid after sign-in
	  secrets_path
  end
  
  before_filter :_set_current_session

  protected
  def _set_current_session
    Thread.current[:session] = session
  end

end
