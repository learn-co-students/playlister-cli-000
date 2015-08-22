class Genre

  attr_accessor :name, :song, :artist, :songs

THESE = []

  def initialize(name = nil)
    @name = name
    THESE << self
  end

  def songs
    Song::FLICK
  end

  def artists
    Artist::CREATED
  end

  def self.reset_all
    Song::FLICK.clear
    THESE.clear
    Artist::CREATED.clear
  end

  def self.all
    THESE
  end

  def self.create_by_name(newGenre)
    this = self.new
    this.name = newGenre
    this
  end

  def self.reset_genres
    THESE.clear
  end

  def self.find_by_name(genre)
    THESE.select{|instance| instance.name == genre}.first
  end

  def self.count
    THESE.count
  end

end