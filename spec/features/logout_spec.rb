require 'rails_helper'
require 'spec_helper'

# rspec spec/features/logout_spec.rb to execute test

feature 'User logs out' do
  before do 
    #Create a user
    User.create!(email:'per4mnce@gmail.com', password: 'password', pin: '12345678', pin_confirmation: '12345678' )
  end
  
  scenario 'with Log-Out Button' do
    login_with('per4mnce@gmail.com', 'password', '12345678')
    click_on "Log-Out"
    expect(page.find('.alert')).to have_content 'Signed out successfully'   
  end

  def login_with(email, password, pin)
    visit '/users/sign_in'
    
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    fill_in 'Pin', with: pin
    
    click_button 'Log in'
  end
end
