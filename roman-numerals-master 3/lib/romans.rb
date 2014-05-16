def number_converter(number) 

   romans = {
    1000 => "M",
    900 => "CM",  
    500 => "D",
    400 => "CD",
    100 => "C",
    90 => "XC",
    50 => "L",
    40 => "XL",  
    10 => "X",
    9 => "IX",  
    5 => "V",
    4 => "IV",  
    1 => "I"
  }

  number = number
    roman = ""
  romans.each do |arabic, numeral|
    roman << numeral*(number / arabic)
      number = number % arabic
    end
    return roman

end
 
number_converter(1984)