require 'docking_station'

describe DockingStation do 
	it { is_expected.to respond_to(:release_bike) }
	it { is_expected.to respond_to(:dock_bike) }
	it 'docks a bike' do 
		my_station = DockingStation.new(0)
		bike = double("Bike", :dock_or_not => true, :is_working => true)
		my_station.dock_bike(bike)
		expect(my_station.docked_bike.length).to eq(1)
	end
	it "can see the docked bikes" do
		my_station = DockingStation.new(0)
		bike = double("Bike", :dock_or_not => true, :is_working => true)
		my_station.dock_bike(bike)
		expect(my_station.docked_bike.length).to eq(1)
	end
	it 'does not release when none available' do
		my_station = DockingStation.new(0)
		bike = double("Bike", :dock_or_not => true, :is_working => false)
		expect { my_station.release_bike }.to raise_error(StandardError, 'Sorry, no working bikes available')
	end
	it "refuses to dock bikes when full capacity" do
		my_station = DockingStation.new
		bike = double("Bike", :dock_or_not => true)
		expect { my_station.dock_bike(bike) }.to raise_error(StandardError, 'Sorry, we ran out of space')
	end
	it "records broken bikes" do 
		my_station = DockingStation.new(0)
		bike = double("Bike", :dock_or_not => true, :is_working => false)
		my_station.dock_bike(bike)
		expect(my_station.broken_bike.length).to eq(1)
	end
	it "release only working bikes" do
		my_station = DockingStation.new(0)
		bike = double("Bike", :dock_or_not => true, :is_working => false)
		my_station.dock_bike(bike)
		expect { my_station.release_bike }.to raise_error(StandardError, 'Sorry, no working bikes available')
	end
end