require 'rails_helper'
require 'spec_helper'

# rspec spec/features/login_spec.rb to execute test

feature 'User logs in' do
  before do 
    #Create a user
    User.create!(email:'per4mnce@gmail.com', password: 'password', pin: '12345678', pin_confirmation: '12345678' )
  end
  
  scenario 'with valid email and password' do
    login_with('per4mnce@gmail.com', 'password', '12345678')
    expect(page.find('.alert')).to have_content 'Signed in successfully'   
  end

  scenario 'with invalid email' do
    login_with('invalid_email', 'password', '12345678')
    expect(page).to have_content('Invalid email or password')
  end

  scenario 'with invalid password' do
    login_with('per4mnce@gmail.com', 'wrong_password', '12345678')
    expect(page).to have_content('Invalid email or password')
  end

  def login_with(email, password, pin)
    visit '/users/sign_in'
    
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    fill_in 'Pin', with: pin
    
    click_button 'Log in'
  end
end
