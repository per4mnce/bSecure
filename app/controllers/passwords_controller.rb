class PasswordsController < Devise::PasswordsController
  def create 
    super
  end
  
  def new
    super
  end
  
  def update
    session[:pin] = params[:user][:pin]
    Rails.logger.info ">>>>>> Pin set to #{session[:pin]}"
    super
  end
  
  def edit
    super
  end
end