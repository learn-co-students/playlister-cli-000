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
    artist = Artist.new.tap {|a| a.name = artist_name}
    genre = Genre.new.tap {|g| g.name = genre_name}
    song = Song.new.tap {|s| s.name = song_name}
    song.genre = genre
    song.artist = artist
    return song
  end

  def call
  	@files.each_with_object([]) do |file, answer_array|
  		parts = self.parse_filename(file)
  		song = build_song(parts[0], parts[1], parts[2])
  		answer_array<<song
  	end
  end

end