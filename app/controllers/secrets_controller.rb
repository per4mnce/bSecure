class SecretsController < ApplicationController
  
  before_action :set_record, except: [:index, :new, :create]
  before_action :authenticate_user!
  
  def new
    @secret = Secret.new
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
    @secrets = current_user.secrets.order("catname ASC")
  end

  def show
    # Render the show view
  end
  
  
  private
  
  def set_record
    @secret = Secret.find(params[:id])
    # begin
    #   @wiki = current_user.wikis.find(params[:id]) 
    # rescue 
    #   @wiki = nil
    # end
  end
  
  def secret_params
    params.require(:secret).permit(:catname, :description, :username, :url, :notes, :pw )
  end
  
end
