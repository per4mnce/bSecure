class Secret < ActiveRecord::Base
  belongs_to :user
  
  userPin = "1234" #Must get this from login screen.  SHould not be save to DB
  
  #Encrypt fields with the help of attr_encrypted gem 
  #See https://github.com/attr-encrypted/attr_encrypted for details
  attr_encrypted :username,
                 :pw,
                 :url,
                 :notes,
                 :key => ENV["encryption_key"] + userPin
end
