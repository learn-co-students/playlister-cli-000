class LibraryParser
  #attr_accessor :files

 def call
  # code here
  self.files
  for file in @files
    self.build_song(file)
  end
 end

  def files
    @files = Dir['db/data/*']
  end

  def parse_filename(filename)
    filename.slice!(0..7)
    filename.slice!(-4..-1)
    info = filename.split(" - ")
  end

  def build_song(filename)
    song_array = parse_filename(filename) #[artist_name, song_name, genre_name]
    song_name = song_array[1]
    artist_name = song_array[0]
    genre_name = song_array[2]
    song = Song.create_by_name(song_name)
    artist = Artist.create_by_name(artist_name)
    genre = Genre.create_by_name(genre_name)
    artist.add_song(song)
    song.genre=(genre)
    return song
  end

end
