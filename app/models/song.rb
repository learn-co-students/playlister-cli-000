require 'pry'

class Song

  attr_accessor :name, :genre, :artist, :songs

  FLICK = []

  public

  def initialize(name = nil)
    @name = name
    @songs = []
    FLICK << self
  end

  # def genre
  #   @genre = Genre.new
  # end

  def to_s
    "#{self.artist.name} - #{self.name} [#{self.genre.name}]"
  end

  def self.find_by_name(song)
    FLICK.each do |instance|
      if song == instance.name
        return instance
      else
        instance
      end
    end
  end

  def self.create_by_name(song)
    this = self.new
    this.name = song
    this
  end

  def self.reset_all
    FLICK.clear
    Genre::THESE.clear
    Artist::CREATED.clear
  end

  def self.count
    FLICK.count
  end

  def self.all
    FLICK
  end
  

  def self.reset_songs
    FLICK.clear
  end

end