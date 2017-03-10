class Song
  extend Findable

  attr_accessor :name, :artist
  attr_reader :genre

  SONGS = []

  def initialize
    SONGS << self
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self
  end

  def self.reset_all
    SONGS.clear
  end

  def self.count
    self.all.count
  end

  def self.all
    SONGS
  end

  def to_s
    artist_name = self.artist.name
    genre_name = self.genre.name

    "#{artist_name} - #{self.name} [#{genre_name}]"
  end
end
