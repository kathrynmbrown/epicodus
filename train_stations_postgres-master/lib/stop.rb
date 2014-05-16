class Stops

  attr_reader :train_id, :station_id, :time

  def initialize(train_result, station_result, time)
    @train_id = train_result
    @station_id = station_result
    @time = time
  end

  def self.all
    results = DB.exec("SELECT * FROM stops;")
    stops = []
    results.each do |train, station, time|
      train_id = train['id']
      station_id = station['id']
      time = time['id']
      stops << Stops.new(station_id, train_id, time)
    end
    stops
  end

  def save
    DB.exec("INSERT INTO stops (train_id, station_id, time) VALUES ('#{@train_id}', '#{@station_id}', '#{@time}');")
  end

  def find_trains_id(train)
    Train.all.each do |train|
     @current_train = train['id'].to_i
    end
  end

def find_station_id(station)
  Station.all.each do |station|
    @current_station = station['id'].to_i
  end
end

  def ==(another)
    self.train_id == another.name
    self.station_id == another.name
    self.time == another.name
  end
end

