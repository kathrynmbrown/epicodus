class Triangle
  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
  end

  def triangle_type
    if (@side1 + @side2) <= @side3 || (@side2 + @side3) <= @side1 || (@side1 + @side3) <= @side2
     'Invalid'
    elsif @side1 == @side2 && @side2 == @side3
     'Equalateral'
    elsif @side1 == @side2 || @side2 == @side3 || @side1 == @side3
      'Isosceles'
    else 'Scalene'
    end
  end
end

