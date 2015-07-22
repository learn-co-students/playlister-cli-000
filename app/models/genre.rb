class Genre
  # class
  @@genres = []
  
  def self.count
    @@genres.size
  end
  
  def self.all
    @@genres
  end
  
  def self.find_by_name(name)
    @@genres.each{ |genre| return genre if genre.name == name }
  end
  
  def self.create_by_name(name)
    new_genre = self.new
	new_genre.name = name
	new_genre
  end
  
  def self.reset_all
    @@genres.clear
  end
  
  # instance
  attr_accessor :name
  
  def initialize
    @@genres << self
	@songs = []
	@artists = []
  end

  def songs
    @songs
  end	
  
  def artists
    @artists
  end	
end