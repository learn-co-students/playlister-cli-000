class Genre
  # code here

  attr_accessor :name, :songs, :artists

  @@all_genres = []

  def initialize
    @songs = []
    @artists = []
    @@all_genres << self
  end

  def self.reset_all
    @@all_genres.clear
  end

  def self.all
    @@all_genres
  end

  def self.reset_all
    @@all_genres.clear
  end

 def self.count
    @@all_genres.count
  end

  def self.create_by_name(name)
    new_genre = self.new
    new_genre.name = name
    new_genre
  end

  def self.find_by_name(name)
    @@all_genres.each do |genre|
      if genre.name == name
        return genre
      end
    end
  end

end