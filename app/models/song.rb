class Song
  # code here
  attr_accessor :name, :genre, :artist
  @@all = []

  def initialize
    @name = name
    @artist = artist
    @genre = genre
    @@all << self
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self
  end

  def to_s
    return "#{self.artist.name} - #{self.name} [#{self.genre.name}]"
  end

  def self.create_by_name(name)
    song = Song.new
    song.name = name
    return song
  end

  def self.find_by_name(name)
    for song in @@all
      if song.name == name
        return song
      end
    end
  end

  def self.all
    @@all
  end

  def self.count
    @@all.size
  end

  def self.reset_all
    @@all.clear
  end
end
