class Artist 
  
  attr_accessor :name, :songs, :genres 
  
  extend Concerns::Findable
  
  @@all = []
  
  def initialize(name) 
    @name = name 
    @songs = []
  end 
  
  def self.all 
    @@all 
  end 
  
  def save 
    @@all << self 
  end 
  
  def self.destroy_all 
    self.all.clear 
  end 
  
  def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
  end 
  
  def songs 
    @songs
  end 
  
  def add_song(song)
    song.artist = self unless song.artist == self
    @songs << song unless @songs.include?(song)
  end
      
  def genres 
    genres = @songs.collect do |song|
      song.genre 
    end 
    genres.uniq
  end 
  
end 