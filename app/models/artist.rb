class Artist
  # class
  @@artists = []
  
  def self.count
    @@artists.size
  end
  
  def self.all
    @@artists
  end
  
  def self.find_by_name(name)
    @@artists.each{ |artist| return artist if artist.name == name }
  end
  
  def self.create_by_name(name)
    new_artist = self.new
	new_artist.name = name
	new_artist
  end
  
  def self.reset_all
    @@artists.clear
  end
  
  # instance
  
  attr_accessor :name
  
  def initialize
    @@artists << self
	@songs = []
	@genres = []
  end
  
  def add_song(song)
    @songs << song unless @songs.include?(song)
	@genres << song.genre unless song.genre == nil || @genres.include?(song.genre) 
	song.genre.artists << self unless song.genre == nil || song.genre.artists.include?(self)
  end
  
  def add_songs(songs_array)
    songs_array.each{ |song| add_song(song) }
  end
  
  def songs
    @songs
  end
  
  def genres
    @genres
  end	
end