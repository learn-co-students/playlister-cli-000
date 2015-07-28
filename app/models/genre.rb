class Genre

	attr_accessor :name
	attr_reader :artists, :songs

	include Findable
	extend Findable

	def initialize
		super
		@artists = []
		@songs = []
	end

end