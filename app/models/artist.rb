class Artist
  # code here
  attr_accessor :songs, :name, :genres

    @@all = []

    def initialize
      @name = name
      @songs = []
      @genres = []
      @@all << self
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

    def add_song(song)
      @songs << song
      song.artist = self
    end

    def add_songs(songs)
      for each_song in songs
        @songs << each_song
        each_song.artist = self
      end
    end

    def self.create_by_name(name)
      artist = Artist.new
      artist.name = name
      return artist
    end

    def self.find_by_name(name)
      for artist in @@all
        if artist.name == name
          return artist
        end
      end
    end

    def genres
      @songs.each do |song|
        @genres << song.genre
      end
      @genres
    end

end
