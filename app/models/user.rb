class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :validatable, :timeoutable
         
         #eliminate :rememberable and :trackable 
         
  has_many :secrets
  
  attr_accessor :pin, :pin_confirmation
  
  validates :pin, length: { minimum: 8 }
  validates :pin, confirmation: true #Make sure pin and pin_confirmation match
  validates :pin_confirmation, presence: true
  validate :pin_cannot_equal_password
  
  def pin_cannot_equal_password
    #Make sure pin is not the same as the password
    if pin == password
      errors.add(:pin, "can't be the same as your password")
    end
  end
  
end
