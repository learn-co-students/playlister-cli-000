require 'pry'

class Artist
  extend Findable

  attr_accessor :name, :songs

  ARTISTS = []

  def initialize
    ARTISTS << self
    @songs = []
    @genres = []
  end

  def self.reset_all
    ARTISTS.clear
  end

  def self.all
    ARTISTS
  end

  def self.count
    self.all.count
  end

  def add_song(song)
    @songs << song
    song.artist = self
  end

  def add_songs(songs)
    songs.each { |song| add_song(song) }
  end

  def genres
    self.songs.map { |song| song.genre }.uniq
  end
end
