class Secret < ActiveRecord::Base
  belongs_to :user
  
  #attr_encrypted: foo
end
