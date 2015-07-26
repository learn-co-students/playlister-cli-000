class LibraryParser

	attr_accessor :files

	def initialize
		@files = Dir['db/data/*']
	end

	def parse_filename(mp3)
		parts = []
		parts<<mp3.split(' - ')[0]
		parts<<mp3.split(' - ')[1].split(' [')[0]
		parts<<mp3.split(' - ')[1].split(' [')[1].split('].')[0]
		parts
	end

	def build_song(artist, song, genre)
		artist = Artist.new
		genre = Genre.new
		song = Song.new.tap {|x| x.artist = artist; x.genre = genre}
		binding.pry
	end

end