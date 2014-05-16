require 'spec_helper'

describe 'new product created' do
  it 'successfully go to new product form' do
    visit root_path
    click_link 'Add a New Product'
    page.should have_content 'Product image'
  end
  it 'successfully add product' do
    visit root_path
    click_link 'Add a New Product'
    fill_in 'Name', with: 'Foo'
    fill_in 'Description', with: 'Bar'
    fill_in 'Price', with: '4.00'
    attach_file("productimage", File.expand_path("./app/assets/images/rings.jpg"))
    click_button "Create Product"
    page.should have_xpath("//img[@alt='rings']")
  end
end
