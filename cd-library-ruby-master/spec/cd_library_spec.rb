require 'rspec'
require 'CD_class'
require 'Model'


describe CD do
  before do
    CD.clear
  end

  describe '#initialize' do
    it 'it is initialized with a hash of artist and album details' do
      new_artist = Artist.new("Whitney")
      test_cd = CD.create({:artist => new_artist, :album => "Bodyguard"})
    test_cd.should be_an_instance_of CD
    end
  end

  describe ".all" do
    it "is an empty array that will contain the cds" do
      CD.all.should eq []
    end
  end

  describe ".create" do
    it 'creates a new instance of cd' do
      new_artist = Artist.new("Whitney")
      test_cd = CD.create({:artist => new_artist, :album => "Bodyguard"})
      test_cd.should be_an_instance_of CD
    end
    it 'saves a new instance of cd to the array' do
      new_artist = Artist.new("Whitney")
      test_cd = CD.create({:artist => new_artist, :album => "Bodyguard"})
      CD.all.should eq [test_cd]
    end
  end

  describe '.search_by_album' do
    it 'searches the library by title and returns the CD object' do
      new_artist1 = Artist.new("Whitney")
      test_cd1 = CD.create({:artist => new_artist1, :album => "Bodyguard"})
      new_artist2 = Artist.new("Bobby")
      test_cd2 = CD.create({:artist => new_artist2, :album => "The Greatest"})
      CD.search_by_album("The Greatest").should eq [test_cd2]
   end
  end

  describe '.search_by_name' do
    it 'searches the library by name and returns a CD object' do
      new_artist1 = Artist.new("Whitney")
      test_cd1 = CD.create({:artist => new_artist1, :album => "Bodyguard"})
      new_artist2 = Artist.new("Bobby")
      test_cd2 = CD.create({:artist => new_artist2, :album => "The Greatest"})
      CD.search_by_name("Bobby").should eq [test_cd2]
   end

  end

  describe "#save" do
    it 'adds the new cd to the main cd array' do
      new_artist = Artist.new("Whitney")
      test_cd = CD.new({:artist => new_artist, :album => "Bodyguard"})
      test_cd.save
      CD.all.should eq [test_cd]
    end
  end

  describe ".clear" do
    it "clears the main cd array between spec runs" do
      new_artist = Artist.new("Whitney")
      test_cd = CD.create({:artist => new_artist, :album => "Bodyguard"})
      CD.clear
      CD.all.should eq []
    end
  end

  describe '#add_artist' do
    it 'adds a new artist to the cd object instance' do
      new_artist = Artist.new("Whitney")
      test_cd = CD.create({:artist => new_artist, :album => "Bodyguard"})
      second_artist = Artist.new("Bobby")
      test_cd.add_artist(second_artist)
      test_cd.artist[1].should eq second_artist
    end
  end

  describe '#add_album' do
    it 'adds a new album to the cd object instance' do
      new_artist = Artist.new("Whitney")
      test_cd = CD.create({:artist => new_artist, :album => "Bodyguard"})
      test_cd.add_album("Amazing Album")
      test_cd.album[1].should eq "Amazing Album"
    end
  end
end


describe Artist do
  describe '#initialize' do
    it 'is initialized with an artist name' do
      test_artist = Artist.new("Whitney Houston")
      test_artist.should be_an_instance_of Artist
    end
  end
end
