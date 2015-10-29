class Artist

  @@artists = []
  
  attr_accessor :name
  attr_reader :songs, :genres

  def initialize
    @@artists << self
    @songs = []
    @genres = []
  end

  def add_song(song)
    self.songs << song
    song.artist = self
    add_genres
  end

  def add_songs(*songs)
    songs.flatten.each{|song|
      @songs << song
    }
    add_genres
  end

  def add_genres
    self.songs.each{|song|
      if song.genre != nil
        @genres << song.genre
      end
    }
    @genres.uniq!
  end

  def self.create_by_name(name)
    new_artist = Artist.new
    new_artist.name=(name)
    new_artist
  end

  def self.find_by_name(name)
    found_by_name = "no artists found"
    @@artists.each{|artist|
      if artist.name == name
        found_by_name = artist
      end
    }
    found_by_name
  end

  def self.all
    @@artists
  end

  def self.count
    @@artists.count
  end

  def self.reset_all
    @@artists = []
  end
end