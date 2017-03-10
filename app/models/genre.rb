class Genre
  extend Findable

  attr_accessor :name, :songs

  GENRES = []

  def initialize
    GENRES << self
    @songs = []
  end

  def self.reset_all
    GENRES.clear
  end

  def self.all
    GENRES
  end

  def self.count
    self.all.count
  end

  def artists
    self.songs.map { |song| song.artist }.uniq
  end
end
