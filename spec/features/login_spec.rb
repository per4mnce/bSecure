require 'rails_helper'
require 'spec_helper'

feature 'Visitor signs up' do
  scenario 'with valid email and password' do
    sign_up_with('per4mnce@gmail.com', 'password', '1234')

    expect(page.find('.alert')).to have_content 'Signed in successfully'   
  end

  # scenario 'with invalid email' do
  #   sign_up_with 'invalid_email', 'password'

  #   expect(page).to have_content('Invalid email or password')
  # end

  # scenario 'with blank password' do
  #   sign_up_with 'valid@example.com', ''

  #   expect(page).to have_content('Invalid email or password')
  # end

  def sign_up_with(email, password, pin)
    visit '/users/sign_in'
    
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    fill_in 'Pin', with: pin
    
    click_button 'Log in'
  end
end
