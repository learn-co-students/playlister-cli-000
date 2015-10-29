require 'pry'

class Song

  @@songs = []
  
  attr_accessor :name, :artist
  attr_reader :genre

  def initialize
    @@songs << self
  end

  def genre=(genre)
    @genre = genre
    if !genre.songs.include?(self)
    genre.add_song(self)
    end
  end

  def artist=(artist)
    @artist = artist
    if !artist.songs.include?(self)
      @artist.add_song(self)
    end
    artist.add_genres
  end

  def to_s
    "#{self.artist.name} - #{self.name} [#{self.genre.name}]"
  end

  def self.create_by_name(name)
    new_song = Song.new
    new_song.name=(name)
    new_song
  end

  def self.find_by_name(name)
    found_by_name = "no songs found"
    @@songs.each{|song|
      if song.name == name
        found_by_name = song
      end
    }
    found_by_name
  end

  def self.all
    @@songs
  end

  def self.count
    @@songs.count
  end

  def self.reset_all
    @@songs = []
  end

end