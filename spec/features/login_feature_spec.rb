require 'spec_helper'


# include RandomData
# include SessionsHelper

describe "the signin process", :type => :feature do
  before :each do
    #User.make(:email => 'per4mnce@gmail.com', :password => 'password', :pin => "1234")
  end

  it "signs me in" do
    visit 
    within("#session") do
      fill_in 'Email', :with => 'per4mnce@gmail.com'
      fill_in 'Password', :with => 'password'
      fill_in 'Pin', :with => '1234'
    end
    click_button 'Log in'
    expect(page).to have_content 'Signed in successfully'
  end
end
