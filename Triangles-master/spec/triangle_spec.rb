require 'rspec'
require 'triangles'

describe Triangle do
  it 'creates and initializes a triangle object' do
    test_triangle = Triangle.new(3,3,3)
    test_triangle.should be_an_instance_of Triangle
  end

  it 'calculates the three inputted sides and determines if it is an actual triangle' do
    test_triangle = Triangle.new(5, 5, 20)
    test_triangle.triangle_type.should eq 'not a triangle'
  end

  it 'defines what type of triangle it is' do
    test_triangle = Triangle.new(5,5,5)
    test_triangle.triangle_type.should eq 'equalateral'
  end

  it 'defines what type of triangle it is' do
    test_triangle = Triangle.new(5,5,6)
    test_triangle.triangle_type.should eq 'isosceles'
  end

   it 'defines what type of triangle it is' do
    test_triangle = Triangle.new(3, 5, 7)
    test_triangle.triangle_type.should eq 'scalene'
  end
end

