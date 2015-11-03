require 'rails_helper'
require 'spec_helper'

# rspec spec/features/sign_up_spec.rb to execute test

feature 'Visitor signs up' do
  
  scenario 'with valid email, password, and pin' do
    sign_up_with('per4mnce@gmail.com', 'password', 'password', '12345678', '12345678')
    expect(page.find('.alert')).to have_content 'You have signed up successfully'   
  end
  
  scenario 'with short password' do
    sign_up_with('per4mnce@gmail.com', 'pw', 'pw', '12345678', '12345678')
    expect(page).to have_content 'Password is too short' 
  end
  
   scenario 'with short pin' do
    sign_up_with('per4mnce@gmail.com', 'password', 'password', '123', '123')
    expect(page).to have_content 'Pin is too short' 
  end
  
  scenario 'with password does not equal password_confirmation' do
    sign_up_with('per4mnce@gmail.com', 'password', 'different_password', '12345678', '12345678')
    expect(page).to have_content "Password confirmation doesn't match Password" 
  end
  
  scenario 'with pin does not equal pin_confirmation' do
    sign_up_with('per4mnce@gmail.com', 'password', 'password', '12345678', '87654321')
    expect(page).to have_content "Pin confirmation doesn't match Pin" 
  end
  
  scenario 'with password the same as the pin' do
    sign_up_with('per4mnce@gmail.com', 'password', 'password', 'password', 'password')
    expect(page).to have_content "Pin can't be the same as your password"
  end
  
  def sign_up_with(email, password, password_confirmation, pin, pin_confirmation)
    visit '/users/sign_up'
    
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    fill_in 'Password_Confirmation', with: password_confirmation
    fill_in 'Pin', with: pin
    fill_in 'Pin_Confirmation', with: pin_confirmation
    
    click_button 'Sign up'
  end
end
