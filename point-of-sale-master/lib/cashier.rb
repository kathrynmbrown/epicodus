class Cashier < ActiveRecord::Base

  def self.search(id)
    Cashier.find_by id: id
  end

  def self.pin_match(cashier_id, pin)
    pin.to_s.length == 4
    pin.to_i
    cashier_match = Cashier.search(cashier_id)
    cashier_match.login == pin
  end

end
