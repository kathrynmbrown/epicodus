class Train

  attr_reader :name, :id

  def initialize(train_name, id=nil)
    @name = train_name
    @id = id
  end

  def self.all
    results = DB.exec("SELECT * FROM trains;")
    trains = []
    results.each do |result|
      train_name = result['name']
      train_id = result['id']
      trains << Train.new(train_name, train_id)
    end
    trains
  end

  def save
    DB.exec("INSERT INTO trains (name) VALUES ('#{@name}');")
  end

  def ==(another_train)
    self.name == another_train.name
  end

  def get_stations
    station_array = []
    results = DB.exec("SELECT * FROM trains WHERE id = '#{@id}';")
    results.each do |result|
      puts result['id']
    end
  end
    # results.each do
    #   get station id
    #   query stations table for name of that station (based on above id)
    #   store info into array
    #   return array

end
