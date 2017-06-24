class LibraryParser

  def call
    files.each do |x|
      build_song(x)
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
    parts = parse_filename(filename)
    artistName = parts[0]
    songName = parts[1]
    genreName = parts[2]


    song = Song.create_by_name(songName)

    artist = Artist.create_by_name(artistName)
    song.artist = artist

    genre = Genre.create_by_name(genreName)
    song.genre = genre
    song

  end




end
