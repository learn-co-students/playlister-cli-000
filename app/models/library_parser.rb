class LibraryParser
  # code here
  attr_reader

  def files
    Dir.entries('db/data').reject{|entry| entry == "." || entry == ".."}
  end

  def parse_filename(file)
    parts = []
    parts = file.split(/[-,\[\]]/)
    parts.pop
    parts.each {|x| x.strip!}
  end

  def build_song(artist, song, genre)
    song = Song.create_by_name(song)
    song.artist = Artist.create_by_name(artist)
    song.genre = Genre.create_by_name(genre)
    song
  end

  def call
    files.each do |file|
      parts = parse_filename(file)
      build_song(parts[0], parts[1], parts[2])
    end
  end
end