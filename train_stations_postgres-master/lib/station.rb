class Station

  attr_reader :name

  def initialize(station_name)
    @name = station_name
  end

  def self.all
    results = DB.exec("SELECT * FROM stations;")
    stations = []
    results.each do |name|
      station_name = name['name']
      stations << Station.new(station_name)
    end
    stations
  end

  def save
    DB.exec("INSERT INTO stations (name) VALUES ('#{@name}');")
  end

  def ==(another_station)
    self.name == another_station.name
  end
end

