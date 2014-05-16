require 'spec_helper'

FactoryGirl.define do
  factory :link do
    title 'Foo Bar'
    url 'google.com'
    user_id 0
    post_date { Time.now }
  end
end

describe "adding another link" do
  it 'makes a new link' do
    visit '/links'
    click_link 'New Link'
    expect(page).to have_content 'New link'
    fill_in 'Title', with: 'Lorem Ipsum'
    fill_in 'Url', with: 'google.com'
    fill_in 'User', with: 0
    click_button 'Create Link'
    expect(page).to have_content 'Link was successfully created.'
  end
end

describe "deleting a link" do
  it 'deletes a link' do
    link = create(:link)
    link2 = create(:link, title: 'Rab Oof')
    visit links_path
    page.should have_content 'Foo Bar'
    expect { click_link "Delete" }.to change(Link, :count).by(-1)
    page.should_not have_content 'Foo Bar'
  end
end

# describe "editing a link" do
#   link = FactoryGirl.create :link
#   visit links_path
#
