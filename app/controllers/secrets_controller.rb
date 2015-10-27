class SecretsController < ApplicationController
  
  before_action :set_record, except: [:index, :new, :create]
  before_action :authenticate_user!
  
  def new
    #Allow maximum of 500 records to prevent abuse and overuse
    if current_user.secrets.count >= 500
      flash[:notice] = "Maximum number of records exceeded."
      redirect_to secrets_path
    else
      @secret = Secret.new
    end
    
  end

  def create
     #@secret = Secret.new(secret_params)
     @secret =current_user.secrets.build(secret_params)
    
    if @secret.save
      flash[:notice] = "Saved"
      redirect_to secrets_path
    else
      flash[:error] = @secret.errors.full_messages.to_sentence
      render :new
    end
  end

  def update
    @secret.assign_attributes(secret_params)
     #authorize @wiki
     if @secret.save
       flash[:notice] = "Record was updated."
      redirect_to secrets_path 
     else
       flash[:error] = @secret.errors.full_messages.to_sentence
       render :edit
     end
  end

  def edit
    # Render the edit view
  end

  def destroy
    @secret = Secret.find(params[:id])
     if @secret.destroy
       flash[:notice] = "Record was deleted successfully."
       redirect_to action: :index
     else
       flash[:error] = "There was an error deleting the record."
       render :show
     end
  end

  def index
    #Rails.logger.info ">>>>> pin: #{session[:pin]}"
   begin
   #Catch decryption error
   #Try to decrypt a field to make sure encryption key and pin are correct
   current_user.secrets.first.pw if current_user.secrets.any?
   rescue Exception => e
    if e.message == "bad decrypt"
      redirect_to root_path
      flash[:error] = "Unable to decrypt.  Sign-out and back in again with the correct PIN."
    end
   end
   @secrets_grid = initialize_grid(current_user.secrets,
                    name:                 'g1',
                    order:                'secrets.catname',
                    order_direction:      'asc',
                    per_page:             10,
                    enable_export_to_csv: true,
                    csv_file_name:        'bSecure_Export'
                    )
      export_grid_if_requested('g1' => 'secrets_grid')
  end

  def show
    # Render the show view
  end
  
  
  private
  
  def set_record
    @secret = Secret.find(params[:id])
  end
  
  def secret_params
    params.require(:secret).permit(:catname, :description, :username, :url, :notes, :pw )
  end
  
end
