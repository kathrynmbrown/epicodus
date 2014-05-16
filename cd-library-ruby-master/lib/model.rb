class Model
attr_reader :value, :cds

  def initialize(value)
    @value = value
    @cds = []
  end
end

class Artist < Model
end



