class SessionsController < Devise::SessionsController

  def new
    super
    puts ">>>>>>>>>>>>>>>>>>>>>>>>>Session Controller NEW"
  end
  
  def destroy
    super
    puts ">>>>>>>>>>>>>>>>>>>>>>>>>Session Controller DESTROY"
  end
  
  def create
    puts ">>>>>>>>>>>>>>>>>>>>>>>>>Session Controller CREATE"
    super
  end
  
  def create
    self.resource = warden.authenticate!(auth_options)
      Rails.logger.info ">>>>>>  auth_options: #{auth_options.inspect}"
      set_flash_message(:notice, :signed_in) if is_navigational_format?
      sign_in(resource_name, resource)
      if !session[:return_to].blank?
        redirect_to session[:return_to]
        session[:return_to] = nil
      else
        session[:pin] = params[:user][:pin]
        Rails.logger.info ">>>> pin: #{session[:pin]}"
        respond_with resource, :location => after_sign_in_path_for(resource)
      end
  end

end