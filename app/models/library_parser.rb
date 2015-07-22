class LibraryParser
  # code here
  def files
    Dir['db/data/*'].select { |e| File.file?(e) }
  end
  
  def parse_filename(name)
    match = /^(.+)\s\-\s(.+)\s\[(.+)\]\.mp3$/.match(name)
	[match[1], match[2], match[3]]
  end
  
  def build_song(artist_name, song_name, genre_name)
	song = Song.create_by_name(song_name)
	song.artist = Artist.create_by_name(artist_name)
	song.genre = Genre.create_by_name(genre_name)
	song
  end
  
  def call
    files.each do |file| 
	  artist_name, song_name, genre_name = parse_filename(file)
	  build_song(artist_name, song_name, genre_name)
	end  
  end
end