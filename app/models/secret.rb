class Secret < ActiveRecord::Base
  belongs_to :user
  
  # #Don't encrypt these fields because to allow searching
  # attr_accessor :catname,
  #               :description
 
  #Encrypt fields with the help of attr_encrypted gem 
  #See https://github.com/attr-encrypted/attr_encrypted for details
  attr_encrypted :username,
                 :pw,
                 :url,
                 :notes,
                 :key => "My Secret Key"
  
end
