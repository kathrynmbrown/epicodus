require("rspec")
require("romans")

describe('number_converter') do
  it('takes a single digit number and converts it to a roman numeral') do
  number_converter(5).should(eq("V")) 
  end  
  it('takes a double digit number and converts it to a roman numeral') do
  number_converter(15).should(eq("XV")) 
  end  
end