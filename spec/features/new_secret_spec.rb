require 'rails_helper'
require 'spec_helper'

# rspec spec/features/new_secret_spec.rb to execute test

feature 'User creates a new secret' do
  before do 
    #Create a user
    User.create!(email:'per4mnce@gmail.com', password: 'password', pin: '12345678', pin_confirmation: '12345678' )
  end
  
  scenario "with required fields" do
    preSaveCount = Secret.all.count
    login_with('per4mnce@gmail.com', 'password', '12345678')
    visit '/secrets'
    visit '/secrets/new'
    select('Password', from: 'secret_catname')
    fill_in 'Description', with: 'My description text'
    fill_in 'Username', with: 'My username text'
    fill_in 'Password', with: 'My password text'
    fill_in 'Url', with: 'My URL text'
    fill_in 'Notes', with: 'My Notes text'
    click_button 'Save'
    expect(page.find('.alert')).to have_content 'Saved'
    expect(preSaveCount + 1).to eq(Secret.all.count)
  end
  
  scenario "without required field Type" do
    preSaveCount = Secret.all.count
    login_with('per4mnce@gmail.com', 'password', '12345678')
    visit '/secrets'
    visit '/secrets/new'
    select('', from: 'secret_catname')
    fill_in 'Description', with: 'My description text'
    fill_in 'Username', with: 'My username text'
    fill_in 'Password', with: 'My password text'
    fill_in 'Url', with: 'My URL text'
    fill_in 'Notes', with: 'My Notes text'
    click_button 'Save'
    expect(page.find('.alert')).to have_content "Type can't be blank"
    expect(preSaveCount).to eq(Secret.all.count)
  end
  
  scenario "without required field Description" do
    preSaveCount = Secret.all.count
    login_with('per4mnce@gmail.com', 'password', '12345678')
    visit '/secrets'
    visit '/secrets/new'
    select('Password', from: 'secret_catname')
    fill_in 'Description', with: ''
    fill_in 'Username', with: 'My username text'
    fill_in 'Password', with: 'My password text'
    fill_in 'Url', with: 'My URL text'
    fill_in 'Notes', with: 'My Notes text'
    click_button 'Save'
    expect(page.find('.alert')).to have_content "Description can't be blank"
    expect(preSaveCount).to eq(Secret.all.count)
  end

  def login_with(email, password, pin)
    visit '/users/sign_in'
    
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    fill_in 'Pin', with: pin
    
    click_button 'Log in'
  end
  
end
