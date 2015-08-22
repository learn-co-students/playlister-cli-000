require 'pry'

class LibraryParser

  attr_accessor :relative_path, :files

  def initialize()
    @files = Dir.entries("db/data")
    @files.delete_at(0)
    @files.delete_at(0)
  end

  def files
   @files
  end

  def parse_filename(file_name)
    parts = []
    name = file_name[/\A\b.*[\-]/].chars
    name.pop(2)
    parts << name.join
    song = file_name[/[\-]\s.*\[/].chars
    song.pop(2)
    song.delete_at(0)
    song.delete_at(0)
    parts << song.join
    parts << file_name[/\[(.+)\]/, 1]
    parts
  end

  def build_song(artist, song, genre)
    artist_new = Artist.new(artist)
    genre_new = Genre.new(genre)
    song_new = Song.new(song)
    song_new.artist = artist_new
    song_new.genre = genre_new
    song_new
    # artist_new = Artist.new(artist)
    # artist_new.add_song(song_new)
    # song_new.artist = artist_new
    # artist_new
  end

  def call
    @files.each do |file|
      parsed_file = parse_filename(file)
      build_song(parsed_file[0], parsed_file[1], parsed_file[2])
    end

  end
end