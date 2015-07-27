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

  def build_song(artist_name, song_name, genre_name)
    artist = Artist.create_by_name(artist_name)
    genre = Genre.create_by_name(genre_name)
    song = Song.new.tap {|x| x.artist = artist; x.genre = genre;x.name = song_name}
    binding.pry
    return song
  end

end