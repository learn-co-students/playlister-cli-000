class Artist
  # code here

  attr_accessor :name, :songs, :genres

  @@all_artists = []

  def initialize
    @songs = []
    @genres = []
    @@all_artists << self
  end

  def add_song(song)
    @songs << song
    #if a song has genre add to @genres and add artist to genre instance
    if song.genre != nil 
      @genres << song.genre
      if song.genre.artists.include?(self) == false
        song.genre.artists << self
      end
    end
  end

  def add_songs(songs_array)
    songs_array.each {|x| add_song(x)}
  end

  def self.reset_all
    @@all_artists.clear
  end

  def self.all
    @@all_artists
  end

  def self.reset_all
    @@all_artists.clear
  end

 def self.count
    @@all_artists.count
  end

  def self.create_by_name(name)
    new_artist = self.new
    new_artist.name = name
    new_artist
  end

  def self.find_by_name(name)
    @@all_artists.each do |artist|
      if artist.name == name
        return artist
      end
    end
  end

end