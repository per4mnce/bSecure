class SessionsController < Devise::SessionsController

  def new
    super
    puts ">>>>>>>>>>>>>>>>>>>>>>>>>Session Controller NEW"
  end
  
  def destroy
    error = flash[:error]
    signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
    
    if error.blank?
      set_flash_message :notice, :signed_out if signed_out && is_flashing_format?
    else
      flash[:notice] = nil
      flash[:error] = error
    end
    yield if block_given?
    respond_to_on_destroy
    puts ">>>>>>>>>>>>>>>>>>>>>>>>>Session Controller DESTROY"
  end
  
  def create
    puts ">>>>>>>>>>>>>>>>>>>>>>>>>Session Controller CREATE"
    super
  end
  
  def create
    self.resource = warden.authenticate!(auth_options)
      #Rails.logger.info ">>>>>>  auth_options: #{auth_options.inspect}"
      set_flash_message(:notice, :signed_in) if is_navigational_format?
      sign_in(resource_name, resource)
      if !session[:return_to].blank?
        redirect_to session[:return_to]
        session[:return_to] = nil
      else
        session[:pin] = params[:user][:pin]
        #Rails.logger.info ">>>> pin: #{session[:pin]}"
        respond_with resource, :location => after_sign_in_path_for(resource)
      end
  end

end