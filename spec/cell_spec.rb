require "spec_helper"

describe Cell do

	before :each do 
		@cell = Cell.new(true)
	end

	describe "#new" do
		it "Should be alive on a new instance"  do
			expect(@cell.alive?).to be_truthy
		end
	end

	describe "#check value" do
		it "should return true if the cell is alive" do
			@cell.alive = true
			expect(@cell.alive?).to be_truthy
		end

		it "should return false if the cell is dead" do
			@cell.alive = false
			expect(@cell.alive?).not_to be_truthy
		end
	end

	describe "#live" do
		it "should change the cell to be alive" do
			@cell.live
			expect(@cell.alive?).to be_truthy
		end

		it "should change the cell to be dead" do
			@cell.die
			expect(@cell.alive?).not_to be_truthy
		end
	end

end




