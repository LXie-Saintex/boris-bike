require 'docking_station'

describe Bike do 
	it { is_expected.to respond_to(:is_working) }
	it { is_expected.to respond_to(:dock_here) }
	it { is_expected.to respond_to(:do_not_dock_here) }
	it "can be docked" do 
		bike = Bike.new
		bike.dock_here
		expect(bike.dock_or_not).to eq(true)
	end
	it "can be not docked" do 
		bike = Bike.new
		bike.do_not_dock_here
		expect(bike.dock_or_not).to eq(false)
	end
	it "is broken" do
		bike = Bike.new
		bike.is_working = false
		expect(bike.is_working).to eq (false)
	end
end