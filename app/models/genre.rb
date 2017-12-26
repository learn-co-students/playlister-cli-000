class Genre
  # code here
  attr_accessor :songs, :name, :artists
  @@all = []
  def initialize
    @songs = []
    @artists = []
    @name = name
    @@all << self
  end

  def artists
    @songs.each do |song|
      unless @artists.include?(song.artist)
        @artists << song.artist
      end
    end
    @artists
  end

  def self.create_by_name(name)
    genre = Genre.new
    genre.name = name
    return genre
  end 

  def self.find_by_name(name)
    for genre in @@all
      if genre.name == name
        return genre
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
