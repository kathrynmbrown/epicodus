class Parcel
  def initialize(length, width, height, weight)
    @length = length
    @width = width
    @height = height
    @weight = weight
  end

  def volume
   @length * @width * @height
  end

  def cost_to_ship
    volume * @weight
  end
end

# p = Parcel.new(5,5,2,10)
# puts p.cost_to_ship

