class Secret < ActiveRecord::Base
  belongs_to :user
  
  userPin = "1234" #Thread.current[:session][:pin] #From login screen.  Must not be saved to DB "1234"
  
  #Encrypt fields with the help of attr_encrypted gem 
  #See https://github.com/attr-encrypted/attr_encrypted for details
  attr_encrypted :username,
                 :pw,
                 :url,
                 :notes,
                 :key => ENV["encryption_key"] + userPin
                 
 puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> #{userPin} from Secret Model"
end
