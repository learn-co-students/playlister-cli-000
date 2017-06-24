class Artist
	# code here
	attr_accessor :name, :songs, :genres
	@@artists = []

	def initialize
		@@artists << self
		@genres = []
		@songs = []
	end

	def self.count
		@@artists.count
	end

  	def add_song(song)
    	@songs << song
    	if song.genre
      	@genres << song.genre
   	   song.genre.add_artist(self)
		end

   	   song.artist = self

  	end

	def add_songs(song_array)
		song_array.each {|song| add_song(song)}
	end

	def self.reset_all
		@@artists = []
	end

	def self.all
		@@artists
	end

	def self.find_by_name(artistName)
		@@artists.find{ |artist| artist.name == artistName }
	end

	def self.create_by_name(artistName)
		artist = Artist.new
		artist.name = artistName
		artist
	end


end