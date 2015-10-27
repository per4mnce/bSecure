class RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def create
    #Rails.logger.info ">>>>>>>>>>>>> params: #{sign_up_params.inspect}"
    session[:pin] = params[:user][:pin]
    #Rails.logger.info ">>>>>> Pin set to #{session[:pin]}"
    
    unless params[:user][:pin] == params[:user][:pin_confirmation]
      #Rails.logger.info ">>>>> pin == pin_confirmation? Nope!"
      flash[:error] = "Pins do not match.  Please try again."
      redirect_to new_user_registration_path
    else 
      Rails.logger.info ">>> pins matched"
      super
    end
    
    
    # build_resource(sign_up_params)

    # resource.save
    # yield resource if block_given?
    # if resource.persisted?
    #   if resource.active_for_authentication?
    #     set_flash_message :notice, :signed_up if is_flashing_format?
    #     sign_up(resource_name, resource)
    #     respond_with resource, location: after_sign_up_path_for(resource)
    #   else
    #     set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
    #     expire_data_after_sign_in!
    #     respond_with resource, location: after_inactive_sign_up_path_for(resource)
    #   end
    # else
    #   clean_up_passwords resource
    #   set_minimum_password_length
    #   respond_with resource
    # end
  end

  def update
    super
  end
end 