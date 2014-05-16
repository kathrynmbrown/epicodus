require('rspec')
require('word_calc')

describe('sentence_calc') do
  it('takes a simple addition question with two numbers and returns the numbers added together') do
    sentence_calc("What is 3 plus 5?").should(eq([8]))
  end  
   it('takes a simple subtraction question with two numbers and returns the numbers added together') do
    sentence_calc("What is 5 minus 3?").should(eq([2]))
  end
  it('takes a question with multiple operators and returns the answer') do
    sentence_calc("What is 5 times 3 minus 5 divided by 2 plus 10?").should(eq([22.5]))
  end
  it('takes multiple questions with multiple operators and returns all answers') do
    sentence_calc("What is 5 times 3 minus 5 divided by 2 plus 10? What is 20 divided by 2?").should(eq([22.5,10]))
  end     
end 
