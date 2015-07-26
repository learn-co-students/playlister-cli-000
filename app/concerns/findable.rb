require 'pry'

module Findable

	attr_accessor :name
	NUMBER_OF_INSTANCES = []

	def initialize
		NUMBER_OF_INSTANCES<<self
	end

  def count
    self.all.count
  end

  def reset_all
    self.all.clear
  end

  def all
	 	NUMBER_OF_INSTANCES
	end

  def find_by_name(name)
    NUMBER_OF_INSTANCES.detect{|a| a.name}
    # binding.pry
  end

  def create_by_name(name)
		self.new.name = name
		NUMBER_OF_INSTANCES.last
  end

end