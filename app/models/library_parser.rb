class LibraryParser

 def call
  files.each{|file|
    build_song(file)
  }
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
    
    song_file = parse_filename(filename)
    artist = Artist.create_by_name(song_file[0])


    song = Song.create_by_name(song_file[1])
    song.artist = artist

    genre = Genre.create_by_name(song_file[2])
    
    song.genre = genre
    artist.add_genres

    song

  end


end
