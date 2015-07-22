class Song
  # class
  @@songs = []
  
  def self.count
    @@songs.size
  end
  
  def self.all
    @@songs
  end
  
  def self.find_by_name(name)
    @@songs.each{ |song| return song if song.name == name }
  end
  
  def self.create_by_name(name)
    new_song = self.new
	new_song.name = name
	new_song
  end
  
  def self.reset_all
    @@songs.clear
  end
  
  # instance
  attr_accessor :name, :artist
  attr_reader :genre
  
  def initialize
    @@songs << self
  end

  def genre=(genre)
    @genre = genre
	genre.songs << self unless genre.songs.include?(self)
  end
  
  def to_s
    "#{@artist.name} - #{@name} [#{genre.name}]"
  end
end