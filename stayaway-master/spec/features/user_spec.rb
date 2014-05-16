require 'spec_helper'

describe "the signin process", type: :feature do

   it "signs me in" do
    user = FactoryGirl.create(:user)
    visit '/users/sign_in/'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign in'
    page.should have_content('alicffe@wonderland.com')
  end
end
