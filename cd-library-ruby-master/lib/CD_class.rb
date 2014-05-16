class CD

  attr_reader :artist, :album
  @@all_cds = []


  def CD.all
    @@all_cds
  end

  def CD.clear
    @@all_cds = []
  end

  def CD.create(cd_info)
    new_cd = CD.new(cd_info)
    new_cd.save
    new_cd
   end

  def CD.search_by_album(title)
    found_cd = @@all_cds.select {|cd| cd.album[0] == title}
    found_cd
  end

  def CD.search_by_name(name)
    #detect
    found_cd = @@all_cds.select do |cd|
      matched_artist = cd.artist.select {|artist| artist.value == name}
      cd.artist == matched_artist
    end
    found_cd
  end

  def initialize(cd_info)
    @artist = [cd_info[:artist]]
    @album = [cd_info[:album]]
    @artist.each do |artist|
      artist.cds << self
    end
  end

  def save
    @@all_cds << self
  end

  def add_artist(name)
    @artist << name
  end

  def add_album(title)
    @album << title
  end

end
