require "pry"

class Song
	attr_accessor :name, :artist_name
	
	@@all = []
	
	def self.create
		song = Song.new
		@@all << song
		song
  	end
	  
	def save
		self.class.all << self
	end

	def self.all
		@@all
	end

	def self.new_by_name(song_name)
		song = Song.new
		song.name = song_name
		song
	end

	def self.create_by_name(song_name)
		# binding.pry
		song = self.create
		song.name = song_name
		song
	end

	# This method works but for some reason the test wants the entire @@all array.
	def self.find_by_name(song_name)
		Song.all.detect do |song|
			song.name == song_name
		end
	end

	def self.find_or_create_by_name(song_name)
		self.find_by_name(song_name) ||
		self.create_by_name(song_name)
	end

	def self.alphabetical
		self.all.sort_by do |song| song.name end
	end

	def self.new_from_filename(filename)
		song = Song.new
		parts = filename.split(" - ")
		song.name = parts[1].gsub(".mp3", "")
		song.artist_name = parts[0]
		song
	end

	def self.create_from_filename(filename)
		# binding.pry
		song = self.create
		parts = filename.split(" - ")
		song.name = parts[1].gsub(".mp3", "")
		song.artist_name = parts[0]
		song		
	end

	def self.destroy_all
		# @@all = []
		# self.all = []
		self.all.clear
		# all of the above work.
	end

end

