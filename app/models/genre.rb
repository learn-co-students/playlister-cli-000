class Genre

	attr_reader :artists, :songs

	extend Findable
	include Findable

	def initialize
		super
		@artists = []
		@songs = []
	end

end