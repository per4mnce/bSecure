class RegistrationsController < Devise::RegistrationsController
  
  def new
    super
  end

  def create
    #Rails.logger.info ">>>>>>>>>>>>> params: #{sign_up_params.inspect}"
    session[:pin] = params[:user][:pin]
    #Rails.logger.info ">>>>>> Pin set to #{session[:pin]}"
    super
  end

  def update
    super
  end
  
end 