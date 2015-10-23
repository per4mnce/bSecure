class HelpController < ApplicationController
  
  def show
    if valid_page?
      render template: "help/#{params[:page]}"
    else
      render file: "public/404.html", status: :not_found
    end
  end

  private
  def valid_page?
    File.exist?(Pathname.new(Rails.root + "app/views/help/#{params[:page]}.html.erb"))
  end
 
 
 
  # def show
  #   render template: "help/#{params[:page]}"
  # end
  
end
