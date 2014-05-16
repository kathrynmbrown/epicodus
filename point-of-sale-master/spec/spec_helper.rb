require 'active_record'
require 'shoulda-matchers'
require 'rspec'

require 'product'
require 'cashier'
require 'customer'
require 'purchase'


ActiveRecord::Base.establish_connection(YAML::load(File.open('./db/config.yml'))['test'])

Rspec.configure do |config|
  config.after(:each) do
    Purchase.all.each { |purchase| purchase.destroy }
    Product.all.each { |product| product.destroy }
    Customer.all.each { |customer| customer.destroy }
    Cashier.all.each { |cashier| cashier.destroy }
  end
end
