class Song
	attr_accessor :name, :genre, :artist
	@@songs = []
	def initialize
		@@songs << self
	end

	def self.reset_all
		@@songs = []
	end

	def self.count
		@@songs.count
	end

	def self.all
		@@songs
	end

	def self.find_by_name(songTitle)
		@@songs.find{|song| song.name == songTitle}
	end

	def to_s
 		"#{self.artist.name} - #{self.name} [#{self.genre.name}]"
 	end
	def self.create_by_name(songTitle)
		song = Song.new
		song.name = songTitle
		song
	end

	def genre=(genre)
		@genre = genre
		genre.add_song(self)
	end

end