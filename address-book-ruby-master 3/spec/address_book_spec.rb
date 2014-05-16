require 'rspec'
require 'address_book'
require 'phone'
require 'email'
require 'address'

describe Contact do
  it 'is in initialized with a contact' do
    test_contact = Contact.new('Kathryn')
    test_contact.should be_an_instance_of Contact
  end
  it 'shows the given contact' do
    test_contact = Contact.new('Kathryn')
    test_contact.name.should eq 'Kathryn'
  end
end

describe Phone do
  it 'is initialized with a phone number' do
    test_phone = Phone.new('843-670-2469')
    test_phone.should be_an_instance_of Phone
  end
  it 'shows the given number' do
    test_phone = Phone.new('843-670-2469')
    test_phone.number.should eq '843-670-2469'
  end
end

describe Email do
  it 'is initialized with a email_address' do
    test_email_address = Email.new('name@gmail.com')
    test_email_address.should be_an_instance_of Email
  end
  it 'shows the given number' do
    test_email_address = Email.new('name@gmail.com')
    test_email_address.email_address.should eq 'name@gmail.com'
  end
end

describe Address do
  it 'is initialized with a address' do
    test_address = Address.new('123 Street Pleasant, SC 29464')
    test_address.should be_an_instance_of Address
  end
  it 'shows the given number' do
    test_address = Address.new('123 Street Pleasant, SC 29464')
    test_address.address.should eq '123 Street Pleasant, SC 29464'
  end
end
