class Secret < ActiveRecord::Base
  
  #Relationships
  belongs_to :user
  
  #Validation
  validates :catname, presence: true 
  validates :description, presence: true
  
  #Thread.current[:session][:pin] #From login screen.  Must not be saved to DB "1234"
  
  #Encrypt fields with the help of attr_encrypted gem 
  #See https://github.com/attr-encrypted/attr_encrypted for details
  attr_encrypted :username,
                 :pw,
                 :url,
                 :notes,
                 :key =>  proc { ENV["encryption_key"] + Thread.current[:session][:pin] } 

  #proc forces the Thread.current[:session][:pin] to be evaluated each time
  #For production:  :key => proc { ENV["encryption_key"] + Thread.current[:session][:pin] }
  #For testing and seeding database:   :key => proc { ENV["encryption_key"] + "1234" }
end
