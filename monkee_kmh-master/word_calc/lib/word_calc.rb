def sentence_calc(input) 
  answers = []
  questions = input.split("?")
  questions.each do |question|     
    question = question.delete("?").split(" ")
    statement = []
    operators = {"plus" => "+", "minus" => "-", "times" => "*", "divided" => "/", "modulo" => "%", "power" => "**"}
    
    question.each do |word| 
      if operators.include?(word)
        statement << operators[word]
      elsif word.scan(/\d+/) != []
        statement << word.to_f.to_s    
      end
    end 
  answers << eval(statement.join(""))   
  end
  answers
end

