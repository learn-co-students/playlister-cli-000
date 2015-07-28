class Artist

	attr_accessor :name
	attr_reader :genres, :songs
  
	include Findable
	extend Findable

	def initialize
		super
		@songs = []
		@genres = []
	end

	def add_song(song)
		self.songs<<song
		@genres<<song.genre
		if song.genre
		  song.genre.artists<<self
		  song.genre.artists.uniq!
		end
	end

	def add_songs(song_array)
		song_array.each do |song|
			self.songs<<song
		end
	end

end