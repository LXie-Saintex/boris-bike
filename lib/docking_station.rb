class DockingStation
	DEFAULT_CAPACITY = 20
	attr_reader :docked_bike, :broken_bike
	def initialize(amount = DEFAULT_CAPACITY)
		@docked_bike = []
		@broken_bike = []
		amount.times do  
			bike = Bike.new
			bike.dock_here
			bike.is_working = true
			self.dock_bike(bike)
		end
	end
	def release_bike
		if empty?
			raise StandardError, 'Sorry, no working bikes available'
		else 
			return @docked_bike.pop
		end
	end
	def dock_bike(bike)
		if full?
			raise StandardError, 'Sorry, we ran out of space'
		elsif bike.dock_or_not
			(bike.is_working) ? @docked_bike << bike : @broken_bike << bike
		else
		 "You chose not to dock here"
		end
	end

	private
	def full?
		(@docked_bike.length == DEFAULT_CAPACITY) ? true : false
	end
	def empty?
		(@docked_bike.length == 0) ? true : false
	end
end

class Bike
	attr_accessor :is_working
	attr_reader :dock_or_not
	def initialize
		@dock_or_not = false
	end
	def is_working?
		@is_working = true
	end
	def dock_here 	
		@dock_or_not = true
	end
	def do_not_dock_here
		@dock_or_not = false
	end
end
