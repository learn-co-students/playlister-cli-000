class Song
  # code here

  attr_accessor :name, :artist, :genre
  attr_reader 

  @@all_songs = []
  
  def initialize
    @@all_songs << self
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self
  end

  def self.all
    @@all_songs
  end

  def self.reset_all
    @@all_songs.clear
  end

 def self.count
    @@all_songs.count
  end

  def self.create_by_name(name)
    new_song = self.new
    new_song.name = name
    new_song
  end

  def self.find_by_name(name)
    @@all_songs.each do |song|
      if song.name == name
        return song
      end
    end
  end

  def to_s
    "#{artist.name} - #{name} [#{genre.name}]"
  end

end



