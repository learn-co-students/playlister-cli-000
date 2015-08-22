class Artist

  attr_accessor :name, :songs, :song, :genre, :genres

  CREATED = []

  def initialize(name = nil)
    @name = name
    @songs = []
    @genres = []
    if !CREATED.include?(self)
      CREATED << self
    else
    end
  end

  def add_song(songz)
    if songz.class == Array
      songz.each do |song|
        songs.push(song)
      end
    else
      songs.push(songz)
      genres.push(songz.genre)
    end
  end

  def add_songs(songz)
    if songz.class == Array
      songz.each do |song|
        songs.push(song)
        genres.push(song.genre)
      end
    else
      songs.push(songz)
    end
  end

  def self.reset_all
    Song::FLICK.clear
    Genre::THESE.clear
    CREATED.clear
  end

  def self.find_by_name(artist)
    CREATED.select{|instance| instance.name == artist}.first
  end

  def self.create_by_name(artist)
    this = self.new
    this.name = artist
    this
  end

  def genres=(genre)
    genres.push(genre)
  end

  def self.all
    CREATED
  end

  def self.reset_artists
    CREATED.clear
  end

  def self.count
    CREATED.count
  end

end