require 'spec_helper'

describe 'when a user goes to the homepage' do
  before { visit root_path }

  context 'the header should have content' do
    it 'has "Home | Photastic" as the title' do
      page.should have_title "Home | Photastic"
    end

    it 'has "Sign in" as the sign in link' do
      page.should have_link "Sign In"
    end
  end



end
