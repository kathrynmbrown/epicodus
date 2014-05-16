require 'spec_helper'

describe Cashier do
  it 'returns a cashier name cashier login using its id' do
    test_cashier = Cashier.new({:name => "jenny", :login => 1234})
    test_cashier.id = 1
    test_cashier.save
    Cashier.search(1).should eq test_cashier
  end

  # it 'updates a cashiers name' do
  #   test_cashier = Cashier.new({:name => "jenny", :login => 1234})
  #   test_cashier.id = 1
  #   test_cashier.save
  #   Cashier.search(1).should eq test_cashier
  #   test_cashier.name
  # end

  # it 'matches pin entered by cashier with cashier pin' do
  #   test_cashier = Cashier.new({:name => "jenny", :login => 1234})
  #   test_cashier.id = 1
  #   test_cashier.save
  #   test_cashier.pin_match(1, 1234).should eq true
  # end
end
