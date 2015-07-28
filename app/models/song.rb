# require 'pry'

class Song

	attr_accessor :name
	attr_accessor :artist, :genre

	extend Findable
	include Findable

	def to_s
		"#{@artist.name} - #{@name} [#{@genre.name}]"
	end

	def genre=(genre)
		@genre = genre
		genre.songs<<self
	end

end