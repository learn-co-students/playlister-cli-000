class Genre

  @@genres = []

  attr_accessor :name
  attr_reader :songs, :artists

  def initialize
    @@genres << self
    @songs = []
    @artists = []
    add_artists
  end

  def add_song(song)
    self.songs << song
    song.genre = self
    add_artists
  end

  def add_artists
    self.songs.each{|song|
      @artists << song.artist
    }
    @artists.uniq!
  end

  def self.create_by_name(name)
    new_genre = Genre.new
    new_genre.name=(name)
    new_genre
  end

  def self.find_by_name(name)
    found_by_name = "no genres found"
    @@genres.each{|genres|
      if genres.name == name
        found_by_name = genres
      end
    }
    found_by_name
  end  

  def self.all
    @@genres
  end

  def self.count
    @@genres.count
  end

  def self.reset_all
    @@genres = []
  end
end