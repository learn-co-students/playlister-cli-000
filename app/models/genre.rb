class Genre
	attr_accessor :name, :songs
	@@genres = []

	def initialize
		@@genres << self
		@artists = []
		@songs = []
	end

	def add_song(song)
		@songs << song
	end

	def add_artist(artist)
		@artists << artist
	end

	def artists
		@artists.uniq
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

	def self.find_by_name(genreName)
		@@genres.find{|genre| genre.name == genreName}
	end

	def self.create_by_name(genreName)
		genre = Genre.new
		genre.name = genreName
		genre
	end


end