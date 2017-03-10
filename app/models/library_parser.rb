class LibraryParser

  def call
    files.each do |file|
      build_song(file)
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
    parsed_filename = parse_filename(filename)

    song = Song.create_by_name(parsed_filename[1])
    artist = Artist.create_by_name(parsed_filename[0])
    genre = Genre.create_by_name(parsed_filename[2])

    artist.add_song(song)
    song.genre = genre

    song
  end


end
